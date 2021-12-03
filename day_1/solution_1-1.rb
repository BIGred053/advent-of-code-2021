depth_readings_file = File.open('depths.txt', 'r')

depths = depth_readings_file.read.split("\n")

depths_as_nums = depths.map(&:to_i)

increased_depth_count = 0

deeper_indices = []
less_deep_indices = []

depths_as_nums.each_with_index do |depth, i|
  next if i == 0

  deeper = (depth >= depths_as_nums[i-1])

  increased_depth_count += 1 if deeper

  if deeper
    deeper_indices << i
  else
    less_deep_indices << i
  end

  puts "Curr: #{depth} Last: #{depths[i-1]} - #{deeper ? 'T' : 'F'}"
end

puts increased_depth_count

puts deeper_indices.size

puts less_deep_indices.size
