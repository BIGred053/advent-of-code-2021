diagnostics = File.open('input.txt', 'r').read.lines

gamma_rate = []
epsilon_rate = []

frequencies = {}

diagnostics.each do |diag|
  diag.chomp.chars.each_with_index do |bit, i|
    frequencies[i.to_s] = {} unless frequencies[i.to_s]
    if frequencies[i.to_s][bit.to_s]
      frequencies[i.to_s][bit.to_s] += 1
    else
      frequencies[i.to_s][bit.to_s] = 1
    end
  end
end

puts frequencies

def max_min_positions(frequency_hash)
  frequency_hash['0'] > frequency_hash['1'] ? ['0', '1'] : ['1', '0']
end

frequencies.each do |_pos, frequency_hash|
  max_pos, min_pos = max_min_positions(frequency_hash)
  gamma_rate << max_pos
  epsilon_rate << min_pos
end

def binary_to_decimal(bin_string)
  value = 0
  bin_string.chars.reverse.each_with_index do |bit, i|
    value += (2**i) * bit.to_i
  end

  value
end

gamma_as_num = binary_to_decimal(gamma_rate.join(''))
epsilon_as_num = binary_to_decimal(epsilon_rate.join(''))

puts gamma_rate.join('')
puts epsilon_rate.join('')

puts gamma_as_num
puts epsilon_as_num

puts "Result: #{gamma_as_num * epsilon_as_num}"
