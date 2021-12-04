diagnostics = File.open('input.txt', 'r').read.lines.map(&:chomp)

# gamma_rate = []
# epsilon_rate = []

# frequencies = {}

# diagnostics.each do |diag|
#   diag.chomp.chars.each_with_index do |bit, i|
#     frequencies[i.to_s] = {} unless frequencies[i.to_s]
#     if frequencies[i.to_s][bit.to_s]
#       frequencies[i.to_s][bit.to_s] += 1
#     else
#       frequencies[i.to_s][bit.to_s] = 1
#     end
#   end
# end

def get_common_bit(remaining_diags, idx, return_most_common_bit)
  frequency_hash = {'0' => 0, '1' => 0}
  remaining_diags.each do |diag|
    frequency_hash[diag[idx]] += 1
  end

  if frequency_hash['0'] > frequency_hash['1']
    return_most_common_bit ? '0' : '1'
  elsif frequency_hash['0'] == frequency_hash['1']
    return_most_common_bit ? '1' : '0'
  else
    return_most_common_bit ? '1' : '0'
  end
end
# puts frequencies

def max_min_positions(frequency_hash, for_gamma)
  if frequency_hash['0'] > frequency_hash['1']
    for_gamma ? '0' : '1'
  elsif frequency_hash['0'] == frequency_hash['1']
    for_gamma ? '1' : '0'
  else
    for_gamma ? '1' : '0'
  end
end

# frequencies.each do |_pos, frequency_hash|
#   max_pos = max_min_positions(frequency_hash, true)
#   gamma_rate << max_pos
# end

# frequencies.each do |_pos, frequency_hash|
#   min_pos = max_min_positions(frequency_hash, false)
#   epsilon_rate << min_pos
# end

# puts "Gamma Rate: #{gamma_rate.join('')}"
# puts "Epsilon Rate: #{epsilon_rate.join('')}"

def find_air_quality_rating(diagnostics, for_oxygen)
  aqr = diagnostics.dup

  (0...aqr.first.length).to_a.each do |i|
    puts aqr.inspect if aqr.size <= 10

    curr_common_bit = get_common_bit(aqr, i, for_oxygen)

    puts "#{for_oxygen ? 'Most' : 'Least'} Common Bit in remaining at position #{i}: #{curr_common_bit}"

    diags_to_remove = []
    aqr.each_with_index do |diag, j|
      puts "#{j} - Full string: #{diag.chomp} - value at pos #{i}: #{diag[i]} - Match preferred_bit? #{diag[i] == curr_common_bit}" if aqr.size <= 10
  
      if diag[i] != curr_common_bit
        diags_to_remove << j
      end
    end

    puts diags_to_remove.inspect if aqr.size <= 10

    diags_to_remove.reverse.each do |idx|
      aqr.delete_at(idx)
    end

    puts aqr.inspect if aqr.size <= 10
  
    break if aqr.size == 1
  end

  aqr[0]
end

puts "Calculating Oxygen Rating\n"

oxygen_rating = find_air_quality_rating(diagnostics, true)

puts oxygen_rating

puts "\n\nCalculating CO2 Rating\n"

co2_rating = find_air_quality_rating(diagnostics, false)

puts co2_rating

def binary_to_decimal(bin_string)
  value = 0
  bin_string.chars.reverse.each_with_index do |bit, i|
    value += (2**i) * bit.to_i
  end

  value
end

oxygen_as_num = binary_to_decimal(oxygen_rating.chomp)
co2_as_num = binary_to_decimal(co2_rating.chomp)

puts oxygen_as_num
puts co2_as_num

puts "Result: #{oxygen_as_num * co2_as_num}"
