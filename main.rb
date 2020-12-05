require 'dxopal'
include DXOpal

GROUND_Y = 400
Image.register(:player, 'images/player.png')

# プレイヤーを表すクラスを定義
class Player < Sprite
    def initialize
       x = Window.width / 2
       y = GROUND_Y - Image[:player].height
       image = Image[:player]
       super(x, y, image)
    end

# 移動処理(xからself.xになった)
    def update
        if Input.key_down?(K_LEFT) && self.x > 0
            self.x -= 8
        elsif Input.key_down?(K_RIGHT) && self.x < (Window.width - Image[:player].width)
            self.x += 8
        end
    end
end
    
# クラスここまで
Window.load_resources do
# Playerクラスのオブジェクトを作る
player = Player.new
Window.loop do
    # 入力と移動の処理をする
    player.update

    Window.draw_box_fill(0, 0, Window.width, GROUND_Y, [128, 255, 255])
    Window.draw_box_fill(0, GROUND_Y, Window.width, Window.height, [0, 128, 0])
    # 描画する
    player.draw
    end
end
