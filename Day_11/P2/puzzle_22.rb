#!/usr/bin/env ruby
require_relative 'lib/cavern'

data_file = File.open("Day_11/input_11.txt", 'r')

starting_energy = []
until data_file.eof? do
  starting_energy << data_file.readline.strip.chars.map(&:to_i)
end

cavern = Cavern.new(starting_energy: starting_energy)

steps = 0
until cavern.blackout?
  steps += 1
  cavern.step
end

puts "A syncronized flash occured at step #{steps}"
