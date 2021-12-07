#!/usr/bin/env ruby
require_relative 'lib/population'

data_file = File.open("Day_06/input_06.txt", 'r')
starting_population = data_file.readline.strip.split(",").map(&:to_i)
population = Population.new(starting_population_stages: starting_population)

80.times { population.age_population }

puts "Lanternfish population has grown to #{population.population_size}"
