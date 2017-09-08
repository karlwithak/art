require 'victor'

width = 1000
height = 1000
circle_max_width = 300
svg = Victor::SVG.new width: width, height: height, style: { background: 'hsl(230, 50%, 20%)' }

class ColorDict
    attr_accessor :opacity
    def initialize()
        @hue = 0
        @saturation = "60%"
        @lightness = "50%"
        @alpha = "50%"
    end

    def next_color() 
      @hue = rand(200..260)
    end

    def to_hsla()
      return "hsl(#{@hue}, #{@saturation}, #{@lightness})"
    end

    def to_hsl()
      return "hsl(#{@hue}, #{@saturation}, #{@lightness})"
    end
end

svg.build do 
  cd = ColorDict.new
  10.times do |i|
    cd.next_color
    #stroke_opacity = [cd.opacity, cd.opacity + 0.4].min
    circle(
        cx: rand(width), 
        cy: rand(height), 
        r: circle_max_width/1.5 + rand(circle_max_width/3), 
        fill: cd.to_hsla, 
        fill_opacity: 0.6,
        stroke: cd.to_hsl, 
        stroke_width: 4, 
        stroke_opacity: 0.8,
    )
  end
end

svg.save 'translucent_circles_gen'
