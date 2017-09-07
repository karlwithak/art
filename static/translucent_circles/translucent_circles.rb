require 'victor'

width = 1000
height = 1000
svg = Victor::SVG.new width: width, height: height, style: { background: '#fff' }

class ColorDict
    def initialize()
        @red = 0
        @green = 0
        @blue = 0
        @opacity = 0
    end

    def next_color() 
      @red = rand(256)
      @green = rand(256)
      @blue = rand(256)
      @opacity = rand() / 1.3
    end

    def to_s()
      return "rgba(#{@red}, #{@green}, #{@blue}, #{@opacity})"
    end

    def darker_color()
      @red = [255, @red - 20].min
      @green = [255, @green - 20].min
      @blue = [255, @blue - 20].min
      to_s
    end
end

svg.build do 
  cd = ColorDict.new
  50.times do |i|
    cd.next_color
    circle cx: rand(width), cy: rand(height), r: 100 + rand(100), fill: cd.to_s, stroke: cd.to_s, stroke_width: 2, stroke_opacity: 1
  end
end

svg.save 'translucent_circles_gen'
