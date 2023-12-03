require 'pry'
require 'csv'
require './one/lib/calibration'
require './two/lib/cubes'



puts "---------------- Day 2:  ----------------"
# file = './fixtures/cubes.txt'
file = './data/cubes.txt'
result = Cubes.new(file).valid_game_id_sum

puts "Day 2/1: #{result}"
# puts "Day 2/2: #{result}"

puts "---------------- Day 1: Calibration ----------------"
# file = './fixtures/calibration.txt'
file = './data/calibration.txt'
result = Calibration.new(file).find_digits_for_all_lines

puts "Day 1/1: #{result}"
puts "Day 1/2: #{result}"
