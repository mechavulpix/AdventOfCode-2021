#!/usr/bin/env ruby
require_relative("lib/entry")

data_file = File.open("Day_08/input_08.txt", 'r')

entries = []
until data_file.eof? do
  entries << Entry.new(input_string: data_file.readline.strip)
end

total = 0

entries.each do |entry|
  total += entry.decypher_digits
end

puts "Found a total of #{total} from all decyphered displays"
