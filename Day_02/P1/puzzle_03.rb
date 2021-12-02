#!/usr/bin/env ruby
require_relative 'lib/sub'
require_relative 'lib/pilot'

sub = Sub.new
pilot = Pilot.new(directions_file: "Day_02/input_02.txt")

while pilot.has_directions? do
  pilot.perform_next_direction(sub: sub)
end

puts "Sub ended at #{sub.horizon} on the horizon and #{sub.depth} below sea level"
puts "Generating a magic number of: #{sub.horizon * sub.depth}"
