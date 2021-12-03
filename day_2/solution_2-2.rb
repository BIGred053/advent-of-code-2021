directions = File.open('directions.txt', 'r').read.lines

depth = 0
distance = 0
aim = 0

directions.each do |direction|
  command, amount = direction.chomp.split(" ")

  amount = amount.to_i

  case command
  when 'forward'
    distance += amount
    depth += (amount * aim)
  when 'down'
    aim += amount
  when 'up'
    aim -= amount
  end
end

puts "Depth: #{depth} - Distance: #{distance} - Result #{depth * distance}"
