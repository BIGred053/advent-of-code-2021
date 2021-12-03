directions = File.open('directions.txt', 'r').read.lines

depth = 0
distance = 0

directions.each do |direction|
  command, amount = direction.chomp.split(" ")

  amount = amount.to_i

  case command
  when 'forward'
    distance += amount
  when 'down'
    depth += amount
  when 'up'
    depth -= amount
  end
end

puts "Depth: #{depth} - Distance: #{distance} - Result #{depth * distance}"
