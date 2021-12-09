#!/usr/bin/env ruby
require_relative("lib/height_map")

data_file = File.open("Day_09/input_09.txt", 'r')

heights = []
until data_file.eof? do
  heights << data_file.readline.strip.chars.map(&:to_i)
end

height_map = HeightMap.new(heights: heights)
low_points = height_map.find_low_points

total_risk_level = low_points.map(&:risk_level).sum

puts "Total Risk Level of all low points is #{total_risk_level}"
