require 'victor'

svg = Victor::SVG.new width: 1000, height: 1000, style: { background: '#fff' }

def next_color(color_dict) 
  color_dict[:r] = 28 + ((color_dict[:r] + 5) % 128)
  color_dict[:g] = 28 + ((color_dict[:g] + 10) % 128)
  color_dict[:b] = 28 + ((color_dict[:b] + 15) % 128)
  return "rgb(#{color_dict[:r]}, #{color_dict[:g]}, #{color_dict[:b]})"
end

svg.build do 
  g transform: 'rotate(30 0 0)' do
      ygap = 276
      y = -950 
      xgap = 85
      color_dict = {r:0, g: 0, b: 100}
      7.times do |i|
          y += ygap
          x = -150 - (i * 120)
          10.times do
              color_string = next_color(color_dict)
              path d: "M #{x += (112 + xgap)},#{y} l -56,97 l 112,0 l -56,-97 Z", fill: color_string, stroke: color_string, stroke_width: 50, stroke_linejoin: 'round'
              path d: "M #{x += xgap},#{y} l 112,0 l -56,97 l -56,-97 Z", fill: color_string, stroke: color_string, stroke_width: 50, stroke_linejoin: 'round'
          end
      end
   end
end

svg.save 'triangles3'
