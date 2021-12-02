#!/usr/bin/env ruby

input = File.open("input_01.txt", "r")

last_depth = nil
times_depth_increased = 0

until input.eof? do
  depth = input.readline.to_i

  times_depth_increased += 1 if !last_depth.nil? && depth > last_depth

  last_depth = depth
end

puts "Depth increased a total of #{times_depth_increased} times"
