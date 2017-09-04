require 'victor'

svg = Victor::SVG.new width: 1000, height: 800, style: { background: '#fff' }

def next_color(color_dict, i, j, other) 
  color_dict[:r] = (i * 25).to_i
  color_dict[:b] = (j * 25).to_i
  color_dict[:g] = ((i + j) * 2.8).to_i
  return "rgb(#{color_dict[:r]}, #{color_dict[:g]}, #{color_dict[:b]})"
end

svg.build do 
  g transform: 'rotate(0 0 0)' do
      ygap = 97
      y = -112 
      xgap = 0
      color_dict = {r:0, g: 0, b: 0}
      other = rand(256)
      color_string = ''
      10.times do |i|
          y += ygap
          x = -150 
          x = -180 - ((i % 2) * 56)
          11.times do |j|
              #color_string = next_color(color_dict, i + 0.5, j + 0.5, other)
              path d: "M #{x += (112 + xgap)},#{y} l -56,97 l 112,0 l -56,-97 Z", fill: color_string, stroke: color_string
              color_string = next_color(color_dict, i, j, other)
              path d: "M #{x += xgap},#{y} l 112,0 l -56,97 l -56,-97 Z", fill: color_string, stroke: color_string
          end
      end
   end
end

svg.save 'close_triangles'
