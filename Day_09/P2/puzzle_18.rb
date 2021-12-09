#!/usr/bin/env ruby
require_relative("lib/height_map")

data_file = File.open("Day_09/input_09.txt", 'r')

heights = []
until data_file.eof? do
  heights << data_file.readline.strip.chars.map(&:to_i)
end

height_map = HeightMap.new(heights: heights)
low_points = height_map.find_low_points
basins = low_points.map{ |l| height_map.determine_basin_size(low_point: l) }

multiplied_basin_size = basins.max(3).reduce(1) { |total, size| total *= size }

puts "Total Multiplies Basin Sizes are #{multiplied_basin_size}"
