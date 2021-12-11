#!/usr/bin/env ruby
require_relative 'lib/cavern'

data_file = File.open("Day_11/input_11.txt", 'r')

starting_energy = []
until data_file.eof? do
  starting_energy << data_file.readline.strip.chars.map(&:to_i)
end

cavern = Cavern.new(starting_energy: starting_energy)

100.times { cavern.step }

puts "There were #{cavern.count_all_flashes} total octopus flashes."
