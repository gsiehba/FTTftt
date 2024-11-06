
// // struct Position {
// //   mut x : Int
// //   mut y : Int
// // }

// // let pos : Position = { x: 0, y: 0 }

// fn init {
    //  @wasm4.trace("hello world");
//   let array = [1, 2, 3, 4, 5]
//   // array = [4, 5, 6, 7, 8] // 错误：`let` 创建的是不可变绑定。
//   let mut mut_array = [1, 2, 3, 4, 5]
//   mut_array = [4, 5, 6, 7, 8]
//   println(mut_array)
// }


// pub fn update() -> Unit {
//   //  @wasm4.set_draw_colors(2) // 选用调色板索引为2的颜色，即茜红 
//   // @wasm4.rect(0, 0, 80, 80) // 用茜红绘制一个矩阵 四个参数分别为第三象限的 x, y, width, heigh
//   // @wasm4.set_draw_colors(4) 
//   // @wasm4.line(0, 0, 80, 80)   //一条斜线 从左上到中间(叠加到矩形之上)
//   // @wasm4.line(0, 80, 160, 80) // 中间一条横线 (叠加到矩形之上)
//   // @wasm4.line(80, 0, 80, 160) // 中间一条竖	线 (叠加到矩形之上)
//   // @wasm4.set_draw_colors(3) 
//   // @wasm4.oval(80, 80, 80,80 ) // 圆 第四象限

//   //  if pos.x + 80 <= 160 {
//   //   pos.x += 1
//   // }
//   //  if pos.y + 80 <= 160 {
//   //   pos.y += 1
//   }

//   //   if @wasm4.get_gamepad(index=1).button_right && pos.x + 80 < 160 {
//   //   pos.x += 1
//   // } else if @wasm4.get_gamepad(index=1).button_down && pos.y + 80 < 160 {
//   //   pos.y += 1
//   // } else if @wasm4.get_gamepad(index=1).button_left && pos.x >= 0 {
//   //   pos.x -= 1
//   // } else if @wasm4.get_gamepad(index=1).button_up && pos.y >= 0 {
//   //   pos.y -= 1
//   // }
  
//    @wasm4.set_draw_colors(index=1, 2)
//   @wasm4.rect(pos.x, pos.y, 80, 80)
// }
// pub fn start() -> Unit {
// @wasm4.trace("hello world");
  // @wasm4.trace("Hello world!");
  // @wasm4.set_palette(1, @wasm4.rgb(0x282e30)) // 暗岩灰
  // @wasm4.set_palette(2, @wasm4.rgb(0xaa337f)) // 陈玫红 Maximum Red Purple
  // @wasm4.set_palette(3, @wasm4.rgb(0xd4392e)) // 茜红
  // @wasm4.set_palette(4, @wasm4.rgb(0x898f92)) //

// }


//五子棋开始编写处
// 定义游戏常量和变量
let screen_size : Int = 160
let cell_size : Int = 16
let board_size : Int = 15
// let mut board = @Array.init(board_size * board_size, 0) // 0: empty, 1: player1, 2: player2
let board:Array[Int][Int]= @Array.init(board_size * board_size, 0) // 0: empty, 1: player1, 2: player2


// Draw the game board
pub fn draw_board() -> Unit {
    // for y in 0..board_size {
  for y=0;y<=board_size;y=y+1{
    // for x in 0..board_size {
    for x=0;x<board_size;x=x+1{
      let cell_value = board[y * board_size + x]
      if cell_value == 1 {
        @wasm4.set_draw_colors(index=0x0U, 0x4U) // Player 1 color
        @wasm4.rect(x * cell_size, y * cell_size, cell_size, cell_size)
      } else if cell_value == 2 {
        @wasm4.set_draw_colors(index=0x0U, 0x1U) // Player 2 color
        @wasm4.rect(x * cell_size, y * cell_size, cell_size, cell_size)
      }
      @wasm4.rect(x * cell_size, y * cell_size, cell_size, cell_size) // Grid lines
    }
  }
}
  //   for y in 0..board_size {
  //   for x in 0..board_size {
  //     let cell_value = board[y * board_size + x]
  //     if cell_value == 1 {
  //       @wasm4.set_draw_colors(0x0U, 0x4U) // Player 1 color
  //       @wasm4.rect(x * cell_size, y * cell_size, cell_size, cell_size)
  //     } else if cell_value == 2 {
  //       @wasm4.set_draw_colors(0x0U, 0x1U) // Player 2 color
  //       @wasm4.rect(x * cell_size, y * cell_size, cell_size, cell_size)
  //     }
  //     @wasm4.rect(x * cell_size, y * cell_size, cell_size, cell_size) // Grid lines
  //   }
  // }
// }

// Check if there is a winner
pub fn check_winner() -> Int {
for y in 0..board_size {
for x in 0..board_size {
let cell_value = board[y * board_size + x]
if cell_value != 0 {
        // Horizontal check
        if x + 4 < board_size {
          if board[y * board_size + x] == board[y * board_size + x + 1] &&
             board[y * board_size + x] == board[y * board_size + x + 2] &&
             board[y * board_size + x] == board[y * board_size + x + 3] &&
             board[y * board_size + x] == board[y * board_size + x + 4] {
            return cell_value
          }
        }
        // Vertical check
        if y + 4 < board_size {
          if board[y * board_size + x] == board[(y + 1) * board_size + x] &&
             board[y * board_size + x] == board[(y + 2) * board_size + x] &&
             board[y * board_size + x] == board[(y + 3) * board_size + x] &&
             board[y * board_size + x] == board[(y + 4) * board_size + x] {
            return cell_value
          }
        }
        // Diagonal check (top-left to bottom-right)
        if x + 4 < board_size && y + 4 < board_size {
          if board[y * board_size + x] == board[(y + 1) * board_size + x + 1] &&
             board[y * board_size + x] == board[(y + 2) * board_size + x + 2] &&
             board[y * board_size + x] == board[(y + 3) * board_size + x + 3] &&
             board[y * board_size + x] == board[(y + 4) * board_size + x + 4] {
            return cell_value
          }
        }
        // Diagonal check (bottom-left to top-right)
        if x + 4 < board_size && y - 4 >= 0 {
          if board[y * board_size + x] == board[(y - 1) * board_size + x + 1] &&
             board[y * board_size + x] == board[(y - 2) * board_size + x + 2] &&
             board[y * board_size + x] == board[(y - 3) * board_size + x + 3] &&
             board[y * board_size + x] == board[(y - 4) * board_size + x + 4] {
            return cell_value
          }
        }
      }
    }
  }
  return 0  // No winner
}

// Handle player moves
pub fn make_move(x : Int, y : Int, player : Int) -> Unit {
  if board[y * board_size + x] == 0 { // Only place the move if the cell is empty
    board[y * board_size + x] = player
  }
}

// Game logic update
pub fn update() -> Unit {
  let input = @wasm4.get_gamepad()

  // Player 1 controls (for simplicity, move with up/down buttons)
  if input.button_up {
    make_move(7, 7, 1)  // Example move for player 1 at (7,7)
  }

  // Player 2 controls
  if input.button_down {
    make_move(8, 8, 2)  // Example move for player 2 at (8,8)
  }

  // Check if there is a winner
  let winner = check_winner()
  if winner != 0 {
    if winner == 1 {
      @wasm4.text("Player 1 wins!", 50, 50)
    } else {
      @wasm4.text("Player 2 wins!", 50, 50)
    }
  } else {
    // Continue drawing the board
    draw_board()
  }
}
