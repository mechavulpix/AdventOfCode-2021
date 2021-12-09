#!/usr/bin/env ruby
require_relative("lib/entry")

data_file = File.open("Day_08/input_08.txt", 'r')

entries = []
until data_file.eof? do
  entries << Entry.new(input_string: data_file.readline.strip)
end

total_one_four_seven_eight_digits = 0
entries.each do |entry|
  total_one_four_seven_eight_digits += entry.count_one_four_seven_eight_digits
end

puts "Found a total of #{total_one_four_seven_eight_digits} digits that were a 1, 4, 7, or 8"
