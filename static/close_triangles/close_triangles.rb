require 'victor'

svg = Victor::SVG.new width: 1000, height: 1000, style: { background: '#fff' }

class ColorDict
    attr_accessor :opacity
    def initialize()
        @hue = 0
        @saturation = "70%"
        @lightness = "50%"
    end

    def next_color(j) 
      @hue = ARGV[0].to_i + (j * 4)
    end

    def to_hsl()
      return "hsl(#{@hue}, #{@saturation}, #{@lightness})"
    end
end

svg.build do 
  ygap = 97
  y = -112 
  xgap = 0
  color_dict = ColorDict.new
  11.times do |i|
      y += ygap
      x = -150 
      x = -180 - ((i % 2) * 56)
      11.times do |j|
          color_dict.next_color(j)
          path d: "M #{x += (112 + xgap)},#{y} l -56,97 l 112,0 l -56,-97 Z", fill: color_dict.to_hsl, stroke: color_dict.to_hsl
          color_dict.next_color(j + 0.5)
          path d: "M #{x += xgap},#{y} l 112,0 l -56,97 l -56,-97 Z", fill: color_dict.to_hsl, stroke: color_dict.to_hsl
      end
  end
end

svg.save 'close_triangles'
