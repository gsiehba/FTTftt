// // enum GameState{
// //     GSInit//初始状态
// //     GSGanmeStart//游戏中
// //     GSGameEnd//游戏结束
// // }

// // struct GameStat{
// //  mut game_state:GameState

// // }
// // let game:GameStat={game_state:GSInit}
// pub fn start() -> Unit {
 

// //   @wasm4.trace("Hello world!");
//     @wasm4.trace("Game started!");
// //   @wasm4.set_palette(1, @wasm4.rgb(0x282e30)) // 暗岩灰
// //   @wasm4.set_palette(2, @wasm4.rgb(0xaa337f)) // 陈玫红 Maximum Red Purple
// //   @wasm4.set_palette(3, @wasm4.rgb(0xd4392e)) // 茜红
// //   @wasm4.set_palette(4, @wasm4.rgb(0x898f92)) // 
// // 初始化棋盘和其他参数
// //     @wasm4.trace("Game started!");
// //     draw_board(chessboard);
	
// }

// pub fn update() -> Unit {
//         @wasm4.set_draw_colors(2)
// 	 @wasm4.line(10,0,10,160)
// 	 @wasm4.line(20,0,20,160)
//    @wasm4.line(30,0,30,160)
//    @wasm4.line(40,0,40,160) 
// 	 @wasm4.line(50,0,50,160)
// 	 @wasm4.line(60,0,60,160)
// 	 @wasm4.line(70,0,70,160)
//    @wasm4.line(80,0,80,160)
// 	 @wasm4.line(90,0,90,160)
// 	 @wasm4.line(100,0,100,160)
// 	 @wasm4.line(110,0,110,160)
// 	 @wasm4.line(120,0,120,160)
// 	 @wasm4.line(130,0,130,160)
// 	 @wasm4.line(140,0,140,160)
// 	 @wasm4.line(150,0,150,160)
// 	 @wasm4.line(0,10,160,10)
// 	 @wasm4.line(0,20,160,20)
//    @wasm4.line(0,30,160,30)
//    @wasm4.line(0,40,160,40) 
// 	 @wasm4.line(0,50,160,50)
// 	 @wasm4.line(0,60,160,60)
// 	 @wasm4.line(0,70,160,70)
//    @wasm4.line(0,80,160,80)
// 	 @wasm4.line(0,90,160,90)
// 	 @wasm4.line(0,100,160,100)
// 	 @wasm4.line(0,110,160,110)
// 	 @wasm4.line(0,120,160,120)
// 	 @wasm4.line(0,130,160,130)
// 	 @wasm4.line(0,140,160,140)
// 	 @wasm4.line(0,150,160,150)
  
//     // let game_state = "playing";  // 全局游戏状态
// //    draw_board(chessboard)
// //  if game_state=="playing"{
// //     @wasm4.trace("update")
// //     //   game.game_state="undering"?
//     // person_computer_random()
// //  }

// // match game.game_state{
// //     GSInit=>person_computer_random()
// // }
// }


// //c五子棋改--syf
// //初始化棋子
// let white:Int =-1 
// let black:Int =1
// let blank:Int =0
// let max_row:Int =16
// let max_col:Int =16
// let grid_size: Int = 10;  // 格子的大小，具体值根据你的屏幕和需求调整

// // pub fn man() -> Unit {
// //     @wasm4.trace("Hello world!")
// // }

// // 绘制棋盘和棋子
// pub fn draw_chessman(color: Int, x: Int, y: Int) -> Unit {
// 	//  @wasm4.trace("Hello world!")
//     if color == white {
//         // 绘制白棋
// 		//  @wasm4.trace("Hello world!");
//         @wasm4.rect(x * grid_size, y * grid_size, grid_size, grid_size);
//     } else if color == black {
//         // 绘制黑棋
//         @wasm4.rect(x * grid_size, y * grid_size, grid_size, grid_size);
//     }
// }

// // 更新画面，绘制棋盘和已下的棋子
// pub fn draw_board(chessboard: FixedArray[FixedArray[Int]]) -> Unit {
//     for i = 0; i < max_row; i = i + 1 {
//         for j = 0; j < max_col; j = j + 1 {
//             if chessboard[i][j] != blank {
//                 draw_chessman(chessboard[i][j], i, j);
//             }
//         }
//     }
// }

// // 获取玩家选择的位置
// pub fn get_move() -> (Int, Int) {
    
//     let gamepad = @wasm4.get_gamepad();
//     let mut x = 0;
//     let mut y = 0;
	

//     // 根据按键控制选中的格子
//     if gamepad.button_up {
//         if y > 0 {
// 			@wasm4.trace("dowm")
//             y = y - 1;
//         }
//     } else if gamepad.button_down {
//         if y < max_row - 1 {
//             y = y + 1;
//         }
//     } else if gamepad.button_left {
//         if x > 0 {
//             x = x - 1;
//         }
//     } else if gamepad.button_right {
//         if x < max_col - 1 {
//             x = x + 1;
//         }
//     }

//     // 按A键确认落子位置
//     if gamepad.button_1 {

//         return (x, y);  // 返回当前选中的格子坐标
//     }

//     return (-1, -1);  // 如果没有按下确认键，返回一个无效的位置
// }


// // 判断胜负
// pub fn is_win(chessboard: FixedArray[FixedArray[Int]], row: Int, col: Int) -> Int {
//     // 检查横向、纵向、斜向五子连珠
//     for i = 0; i < row; i = i + 1 {
//         for j = 0; j < col; j = j + 1 {
//             if chessboard[i][j] == blank {
//                 continue;
//             }
//             //  (-)横着连成五子
//             if j < col - 4 {
//                 if chessboard[i][j] == chessboard[i][j + 1] &&
//                    chessboard[i][j] == chessboard[i][j + 2] &&
//                    chessboard[i][j] == chessboard[i][j + 3] &&
//                    chessboard[i][j] == chessboard[i][j + 4] {
//                     return chessboard[i][j];
//                 }
//             }
//             //  (|)竖着连成五子
//             if i < row - 4 {
//                 if chessboard[i][j] == chessboard[i + 1][j] &&
//                    chessboard[i][j] == chessboard[i + 2][j] &&
//                    chessboard[i][j] == chessboard[i + 3][j] &&
//                    chessboard[i][j] == chessboard[i + 4][j] {
//                     return chessboard[i][j];
//                 }
//             }
//             //  (\)左斜连成五子
//             if i < row - 4 && j < col - 4 {
//                 if chessboard[i][j] == chessboard[i + 1][j + 1] &&
//                    chessboard[i][j] == chessboard[i + 2][j + 2] &&
//                    chessboard[i][j] == chessboard[i + 3][j + 3] &&
//                    chessboard[i][j] == chessboard[i + 4][j + 4] {
//                     return chessboard[i][j];
//                 }
//             }
//             //  (/)右斜连成五子
//             if i < row - 4 && j > 4 {
//                 if chessboard[i][j] == chessboard[i + 1][j - 1] &&
//                    chessboard[i][j] == chessboard[i + 2][j - 2] &&
//                    chessboard[i][j] == chessboard[i + 3][j - 3] &&
//                    chessboard[i][j] == chessboard[i + 4][j - 4] {
//                     return chessboard[i][j];
//                 }
//             }
//         }
//     }
//     return blank;
// }


// //人机对战随机算法
// // pub fn random_create_point()->Int {
// //   let limit=16  
// //   let point=@random.new().int(~limit)
// // 	return point;
// // }
// pub fn random_create_point(chessboard: FixedArray[FixedArray[Int]]) -> (Int, Int) {
//     let limit = 16;  // 假设棋盘是16x16
//     let mut x = @random.new().int(~limit);  // 随机生成一个0到15之间的数
//     let mut y = @random.new().int(~limit);  // 随机生成另一个0到15之间的数
// 	while chessboard[x][y] != blank {
//         x = @random.new().int(~limit);
//         y = @random.new().int(~limit);
//     }
//     return (x, y)
// }

// //判断棋盘是否已满
// pub fn is_full(chessboard:FixedArray[FixedArray[Int]], row:Int,col:Int)-> Int{
// 	let ret= 1
//   let i:Int=0
//   let j:Int=0
//  for i = 0; i < row; i=i+1 {
// 		for j = 0; j < col; j=j+1 {
// 			if chessboard[i][j] ==blank{
// 				let ret = 0;
// 				break;
// 			}
// 		}
// 	}
// 	return ret;
// }

// let chessboard:FixedArray[FixedArray[Int]]=[
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], 	
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//     [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
//   ]
// //人机对战
// pub fn person_computer_random()->Unit {
// //   let game_state="undering"
// 	let  i:Int=1
//   let  j:Int=1
// 	//let draw_chessboardn(max_row, max_row, chessboard)
// 	let step:Int=1
// 	let yi:Int=1
	
// 	// let prev_gamepad: @wasm4.GamePad=@wasm4.default()
// 	for step = 1; step <= max_row * max_row; step=step+1 {
// 		if step % 2 == 1 {
			
//             @wasm4.trace("black xia:")
// 			let(x,y)=get_move();//获取玩家选择的格子
//             @wasm4.trace("get gezi")
// 			if x!=-1&&y!=-1&&chessboard[x][y]==blank{
//               chessboard[x][y] = black
// 			  draw_board(chessboard)
// 			  if is_win(chessboard, max_row, max_col) == black {
// 				 @wasm4.trace("black win")
// 				break
// 			}
// 			}
			
// 			}
// 		 else if (step % 2 == 0) {
			
// 			// 白棋（AI）回合
//             // println("白棋的回合AI下棋...");
//              @wasm4.trace("white xia")
//             let (x, y) = random_create_point(chessboard);  // AI随机选择位置
//             chessboard[x][y] = white;
//             draw_board(chessboard);  // 绘制最新棋盘
//             if is_win(chessboard, max_row, max_col) == white {
//                 // println("白棋胜!");
//                 @wasm4.trace("white win")
//                 break;
//             }
// 			}
			
// 		}
// 	if is_full(chessboard, max_row, max_row) == 1{
// 		// println("棋盘已满");
//         @wasm4.trace("is full")
// 	}
// 	}

//初始化棋子
let white:Int =-1 
let black:Int =1
let blank:Int =0
let max_row:Int =16
let max_col:Int =16
let chessboard:FixedArray[FixedArray[Int]]=[
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],  
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], 
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
  ]
// enum GameState{
//     GSInit//初始状态
//     GSGanmeStart//游戏中
//     GSGameEnd//游戏结束
// }

struct GameStat{
 mut game_state:String
 rng:@random.Rand
}

// }
let game:GameStat={game_state:"kaishi",rng:@random.new()}

//初始化棋子
pub fn draw_chessman(chessboard:FixedArray[FixedArray[Int]])->Unit {
   
    for i=0;i<max_row;i=i+1{
        for j=0;j<max_col;j=j+1{
    if chessboard[i][j] == white{
        @wasm4.set_draw_colors(2);
        @wasm4.rect(i*10,j*10,10,10);
}
    if chessboard[i][j] == black{
       
        @wasm4.set_draw_colors(3);
        @wasm4.rect(i*10,j*10,10,10)
  }
    if chessboard[i][j] ==blank{ }
    }}
}

//判断胜负
//返回当前棋子的值，若值为1，代表黑棋胜，若值为-1，代表白棋胜
pub fn is_win( chessboard:FixedArray[FixedArray[Int]])->Int {
   
  for i = 0; i <max_row; i=i+1 {
        for j = 0; j < max_col; j=j+1 {
            if chessboard[i][j] ==blank{
                continue;
      }
            //  (-)横着连成五子
            if j < max_col - 4{
                if chessboard[i][j] == chessboard[i][j + 1] && 
            chessboard[i][j] ==  chessboard[i][j + 2]&& 
              chessboard[i][j] == chessboard[i][j + 3] && 
               chessboard[i][j] == chessboard[i][j + 4]{
                    return chessboard[i][j];}
      }
            //  (|)竖着连成五子
            if i < max_row - 4{
                if chessboard[i][j] == chessboard[i + 1][j] && 
              chessboard[i][j] == chessboard[i + 2][j]&& 
                chessboard[i][j] ==chessboard[i + 3][j] && 
                  chessboard[i][j] ==chessboard[i + 4][j]{
                    return chessboard[i][j];}
      }
            //  (\)左斜连成五子
            if i < max_row- 4 && j < max_col - 4{
                if chessboard[i][j] == chessboard[i + 1][j + 1] &&
             chessboard[i][j] == chessboard[i + 2][j + 2]&&
                        chessboard[i][j] == chessboard[i + 3][j + 3] &&
                  chessboard[i][j] == chessboard[i + 4][j + 4]{
                    return chessboard[i][j];}
      }
            //  (/)右斜连成五子 
            if i < max_row- 4 && j > 4{                 
                if chessboard[i][j] == chessboard[i + 1][j - 1] &&
             chessboard[i][j] ==chessboard[i + 2][j - 2]&& 
              chessboard[i][j] == chessboard[i + 3][j - 3] &&
                chessboard[i][j] == chessboard[i + 4][j - 4]{
                    return chessboard[i][j];}
      }
        }
    }
    return blank;
}
//人机对战随机算法
pub fn random_create_point()->Int {
  let limit=16  
  let point=game.rng.int(~limit)
//   point=@random.new().int(~limit)
    return point;
}

//判断棋盘是否已满
pub fn is_full(chessboard:FixedArray[FixedArray[Int]])-> Int{
    let mut ret= 1
    for i = 0; i < max_row; i=i+1 {
        for j = 0; j < max_col; j=j+1 {
            if chessboard[i][j] ==blank{
                ret = 0;
                break;
            }
        }
    }
    return ret;
}

// //人机对战
pub fn person_computer_random()->Unit {
    let mouse=@wasm4.get_mouse()
    //  let gamepad = @wasm4.get_gamepad();
    let mut place=false
    // max_row * max_row
    for step=1; step <= 2;step=step+1 {
        if step % 2 == 1 &&place==false{
            // @wasm4.text("black xia:", 10, 10);
                if mouse.left{
                        if chessboard[mouse.x/10][mouse.y/10] ==white||chessboard[mouse.x/10][mouse.y/10] ==black{
                            // @wasm4.text("no place", 10, 10);
                            // continue;
                        }
                                    chessboard[mouse.x/10][mouse.y/10] = black;
                                    draw_chessman(chessboard);
                         place=true
                         game.game_state="play"
                    }
                // break;
            if is_win(chessboard) == black {
                // @wasm4.text("black win", 10, 10);
                 game.game_state="kaishi"
                break;
            }
        }
          if step % 2 == 0&&place==true{
            game.game_state="play"
             @wasm4.text("white xia:", 10, 10);
                // @wasm4.trace("bai")
                 let i = random_create_point();
                let j = random_create_point();
                if chessboard[i][j] ==blank{
                    chessboard[i][j] = white;
                    draw_chessman(chessboard);          
                }
                if chessboard[i][j] ==white{
                    @wasm4.trace("bai")
                }
            //draw_chessboardn(max_row, max_row, chessboard);
            if is_win(chessboard) == white {
                // @wasm4.text("white win", 10, 10);
                 game.game_state="kaishi"
                break;
            }
        }
       
    }
    if is_full(chessboard) == 1{
        @wasm4.text("is full", 10, 10);
    }
  game.game_state="kaishi"
}


pub fn update() -> Unit {
         @wasm4.set_draw_colors(2)
	 @wasm4.line(10,0,10,160)
	 @wasm4.line(20,0,20,160)
   @wasm4.line(30,0,30,160)
   @wasm4.line(40,0,40,160) 
	 @wasm4.line(50,0,50,160)
	 @wasm4.line(60,0,60,160)
	 @wasm4.line(70,0,70,160)
   @wasm4.line(80,0,80,160)
	 @wasm4.line(90,0,90,160)
	 @wasm4.line(100,0,100,160)
	 @wasm4.line(110,0,110,160)
	 @wasm4.line(120,0,120,160)
	 @wasm4.line(130,0,130,160)
	 @wasm4.line(140,0,140,160)
	 @wasm4.line(150,0,150,160)

	 @wasm4.line(0,10,160,10)
	 @wasm4.line(0,20,160,20)
   @wasm4.line(0,30,160,30)
   @wasm4.line(0,40,160,40) 
	 @wasm4.line(0,50,160,50)
	 @wasm4.line(0,60,160,60)
	 @wasm4.line(0,70,160,70)
   @wasm4.line(0,80,160,80)
	 @wasm4.line(0,90,160,90)
	 @wasm4.line(0,100,160,100)
	 @wasm4.line(0,110,160,110)
	 @wasm4.line(0,120,160,120)
	 @wasm4.line(0,130,160,130)
	 @wasm4.line(0,140,160,140)
	 @wasm4.line(0,150,160,150)
    @wasm4.set_draw_colors(2);   
    
    //   if game=="init"{
        
    //     @wasm4.trace("update")
    //     let mut game="kaishi"
     
        if game.game_state=="kaishi"{
           game.game_state="play"
           @wasm4.trace("update")
                draw_chessman(chessboard)
          person_computer_random()
        }

    }



pub fn start() -> Unit {


    @wasm4.trace("Game started!");
}
//   @wasm4.set_palette(1, @wasm4.rgb(0x282e30)) // 暗岩灰
//   @wasm4.set_palette(2, @wasm4.rgb(0xaa337f)) // 陈玫红 Maximum Red Purple
//   @wasm4.set_palette(3, @wasm4.rgb(0xd4392e)) // 茜红
//   @wasm4.set_palette(4, @wasm4.rgb(0x898f92)) // 



