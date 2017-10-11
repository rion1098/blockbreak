#!ruby -Ks
require 'dxruby'

whiteImage = Image.new(100, 100,C_WHITE);

#下のバー
bar = Sprite.new(5,460, Image.new(100,20, C_WHITE))
  
#壁、バー
walls =[Sprite.new(0, 0, Image.new(20, 480, C_WHITE)),
  Sprite.new(0, 0, Image.new(640, 20, C_WHITE)),
  Sprite.new(620, 0, Image.new(20, 480, C_WHITE)),
  bar]
  
#ボール
ball = Sprite.new(300, 400,Image.new(20,20).circle_fill(10,10,10,C_WHITE))
  
#ボールが待機状態か？ 0:待機 1:使用中
use = 0;

#ボールの速度
dx = 4
dy = -4

#ブロックの生成
blockImage = Image.new(58, 18, C_WHITE)
blocks = []
5.times do |y|
  10.times do |x|
    blocks << Sprite.new(21+60 * x, 21 + 20 * y, blockImage)
  end
end



Window.loop do

  bar.x = Input.mouse_pos_x
  
  Sprite.draw(walls)
  
  #ボールが待機状態かの確認
  if Input.KEY
  end
  
  
  #ボール描写
  ball.x += dx
  #バウンド
  if ball === walls
    ball.x -= dx
    dx = -dx
  end
  #ブロックとの衝突
  col_x = ball.check(blocks).first
  if col_x
    col_x.vanish
    ball.x -= dx
    dx = -dx
  end
  
  
  ball.y += dy 
  if ball === walls
    ball.y -= dy
    dy = -dy
  end
  
  col_y = ball.check(blocks).first
  if col_y
    col_y.vanish
    ball.y -= dy
    dy = -dy
  end
  
  ball.draw
  
  Sprite.draw(blocks)

  break if Input.key_push?(K_ESCAPE)
end