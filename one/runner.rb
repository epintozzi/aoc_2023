require 'pry'
require 'csv'
require '../one/lib/calibration'



puts "---------------- Day 1: Meal Calories ----------------"
# file = '../one/spec/fixtures/calibration.txt'
file = '../one/data/calibration.txt'
result = Calibration.new(file).find_digits_for_all_lines

puts "Day 1/1: #{result}"
puts "Day 1/2: #{result}"
