#!/usr/bin/env ruby
require_relative 'lib/polymer_template'

data_file = File.open("Day_14/input_14.txt", 'r')

starting_template = data_file.readline.strip.chars
insertion_rules = []

data_file.readline  # Toss the empty line

until data_file.eof? do
  insertion_rules << data_file.readline.split("->").map(&:strip)
end

template = PolymerTemplate.new(starting_template: starting_template, insertion_rules: insertion_rules)

10.times do
  template.perform_insertion_step
end

max_elem, max_quantity = template.most_common
min_elem, min_quantity = template.least_common

puts "The most common element, #{max_elem}, appeared #{max_quantity} times"
puts "The least common element, #{min_elem}, appeared #{min_quantity} times"

puts "Redering a magic number of #{max_quantity - min_quantity}"
