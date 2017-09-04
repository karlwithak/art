require 'victor'

svg = Victor::SVG.new width: 800, height: 1000, style: { background: '#fff' }

def next_color(color_dict) 
  color_dict[:r] = rand(256)
  color_dict[:g] = rand(256)
  color_dict[:b] = rand(256)
  return "rgb(#{color_dict[:r]}, #{color_dict[:g]}, #{color_dict[:b]})"
end

svg.build do 
  g transform: 'rotate(30 0 0)' do
      ygap = 279
      y = -950 
      xgap = 85
      color_dict = {r:0, g: 0, b: 0}
      7.times do |i|
          y += ygap
          x = -150 - (i * 120)
          10.times do
              color_string = next_color(color_dict)
              path d: "M #{x += (112 + xgap)},#{y} l -56,97 l 112,0 l -56,-97 Z", fill: color_string, stroke: color_string, stroke_width: 50, stroke_linejoin: 'round'
              color_string = next_color(color_dict)
              path d: "M #{x += xgap},#{y} l 112,0 l -56,97 l -56,-97 Z", fill: color_string, stroke: color_string, stroke_width: 50, stroke_linejoin: 'round'
          end
      end
   end
end

svg.save 'triangles3'
