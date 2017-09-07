require 'victor'

width = 1000
height = 1000
svg = Victor::SVG.new width: width, height: height, style: { background: '#fff' }

def next_color() 
  color_dict = {}
  color_dict[:r] = rand(256)
  color_dict[:g] = rand(256)
  color_dict[:b] = rand(256)
  return "rgb(#{color_dict[:r]}, #{color_dict[:g]}, #{color_dict[:b]})"
end

svg.build do 
  100.times do |i|
      circle cx: rand(width), cy: rand(height), r: rand(100), fill: next_color, opacity:rand()
  end
end

svg.save 'translucent_circles_gen'
