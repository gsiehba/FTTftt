
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
  
//   //  @wasm4.set_draw_colors(index=1, 2)
//   // @wasm4.rect(pos.x, pos.y, 80, 80)
// }

// pub fn start() -> Unit {
// @wasm4.trace("hello world");
//   // @wasm4.trace("Hello world!");
//   // @wasm4.set_palette(1, @wasm4.rgb(0x282e30)) // 暗岩灰
//   // @wasm4.set_palette(2, @wasm4.rgb(0xaa337f)) // 陈玫红 Maximum Red Purple
//   // @wasm4.set_palette(3, @wasm4.rgb(0xd4392e)) // 茜红
//   // @wasm4.set_palette(4, @wasm4.rgb(0x898f92)) //

// }
// let width = 5

// let height = 15

// let ball_size = 5

// let screen_size = 160

// pub fn paddle_collision(
//   y_1 : Int,
//   y_2 : Int,
//   ball_x : Int,
//   ball_y : Int
// ) -> Int {
//   if ball_x < width && ball_y < y_2 + height && ball_y + ball_size > y_2 {
//     1
//   } else if ball_x + ball_size > screen_size - width &&
//     ball_y < y_1 + height &&
//     ball_y + ball_size > y_1 {
//     -1
//   } else {
//     0
//   }
// }

// pub fn start() -> Unit {
//   @wasm4.set_draw_colors(0x4U, index=1)
//   @wasm4.set_draw_colors(0x1U, index=2)
// }

// struct BallStats {
//   mut ball_x : Int // ball's horizontal pos
//   mut ball_y : Int // ball's vertical pos
//   mut dir_x : Int // ball's direction (horizontal)
//   mut dir_y : Int // ball's direction (vertical)
//   mut y_1 : Int // left bat position
//   mut y_2 : Int // right bat position
//   mut score_1 : Int // player1
//   mut score_2 : Int // player2
// }

// pub fn BallStats::new() -> BallStats {
//   {
//     ball_x: screen_size / 2,
//     ball_y: screen_size / 2,
//     dir_x: 1,
//     dir_y: 1,
//     y_1: screen_size / 2,
//     y_2: screen_size / 2,
//     score_1: 0,
//     score_2: 0,
//   }
// }

// let bs : BallStats = BallStats::new()

// let rng : @random.Rand = @random.new()

// pub fn update() -> Unit {
//   if @wasm4.get_gamepad().button_up && bs.y_1 > 0 {
//     bs.y_1 -= 2
//   } else if @wasm4.get_gamepad().button_down && bs.y_1 + height < screen_size {
//     bs.y_1 += 2
//   }
//   if @wasm4.get_netplay().active {
//     if @wasm4.get_gamepad(index=2).button_up && bs.y_2 > 0 {
//       bs.y_2 -= 2
//     } else if @wasm4.get_gamepad(index=2).button_down &&
//       bs.y_2 + height < screen_size {
//       bs.y_2 += 2
//     }
//   } else {
//     bs.y_2 = bs.ball_y
//   }
//   let dir_now = paddle_collision(bs.y_1, bs.y_2, bs.ball_x, bs.ball_y)
//   if dir_now != 0 { // ball collides
//     let int_rng = rng.int() % 2
//     bs.dir_x = dir_now
//     @wasm4.tone(
//       (2000, 0),
//       @wasm4.ADSR::new(5),
//       @wasm4.ADSRVolume::new(100),
//       @wasm4.ToneFlag::new(),
//     )
//     // bs.dir_y = dir_now * if int_rng != 0 { -1 } else { 1 }
//     let multiplier = if int_rng != 0 { -1 } else { 1 }
//     bs.dir_y = dir_now * multiplier
//   }
//    bs.ball_x += bs.dir_x
//    bs.ball_y += bs.dir_y
// // ball exceeds screen vertically, should bounce back
// if bs.ball_y > screen_size || bs.ball_y < 0 {
//     @wasm4.tone(
//       (2000, 0),
//       @wasm4.ADSR::new(5),
//       @wasm4.ADSRVolume::new(100),
//       @wasm4.ToneFlag::new(),
//     )
//     bs.dir_y = -bs.dir_y
// }
//   // ball exceeds the screen horizontally i.e. player failed to hit it
// if bs.ball_x <= 0 || bs.ball_x > screen_size {
//     if bs.ball_x <= 0 { // left failed
//       bs.score_2 += 1
//     } else if bs.ball_x > screen_size {
//       bs.score_1 += 1 // right failed
//     }
//     bs.ball_x = screen_size / 2
//     bs.ball_y = screen_size / 2
//     @wasm4.tone(
//       (1000, 0),
//       @wasm4.ADSR::new(5),
//       @wasm4.ADSRVolume::new(100),
//       @wasm4.ToneFlag::new(),
//     )
//     bs.dir_x = -bs.dir_x
//   }
//   @wasm4.set_draw_colors(0x4U, index=1)
//   @wasm4.set_draw_colors(0x0U, index=2)
//   @wasm4.text(bs.score_2.to_string(), 70, 0)
//   @wasm4.text(bs.score_1.to_string(), 85, 0)
//   @wasm4.rect(screen_size / 2, 0, 2, screen_size)
//   @wasm4.set_draw_colors(0x2U, index=1)
//   @wasm4.set_draw_colors(0x3U, index=2)
//   @wasm4.oval(bs.ball_x, bs.ball_y, ball_size, ball_size)
//   @wasm4.rect(0, bs.y_2, width, height)
//   @wasm4.rect(screen_size - width, bs.y_1, width, height)
// }
