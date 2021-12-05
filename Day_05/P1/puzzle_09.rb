#!/usr/bin/env ruby
require_relative 'lib/segment'
require_relative 'lib/terrain'

data_file = File.open("Day_05/input_05.txt", 'r')

segments = []

until data_file.eof? do
  segments << Segment.parse(segment_string: data_file.readline.strip)
end

rows = segments.map(&:max_y).max + 1
columns = segments.map(&:max_x).max + 1

terrain = Terrain.new(rows: rows, columns: columns)

segments.select{ |s| s.orientation != :diagonal }.each do |segment|
  terrain.add_segment(segment: segment)
end

puts "Terrain has #{terrain.get_overlap_point_total} points of overlap"
