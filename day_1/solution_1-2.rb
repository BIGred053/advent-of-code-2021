depth_readings_file = File.open('depths.txt', 'r')

depths = depth_readings_file.read.split("\n")

depths_as_nums = depths.map(&:to_i)

increased_depth_count = 0

depths_as_nums.each_with_index do |depth, i|
  next if i < 3

  last_depth = depths_as_nums[i-1]
  last_last_depth = depths_as_nums[i-2]
  last_last_last_depth = depths_as_nums[i-3]

  curr_trio = depth + last_depth + last_last_depth
  last_trio = last_depth + last_last_depth + last_last_last_depth

  increased_depth_count += 1 if curr_trio > last_trio
end

puts increased_depth_count
