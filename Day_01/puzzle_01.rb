#!/usr/bin/env ruby
require './lib/scanner'

scanner = Scanner.new(filename: "Day_01/input_01.txt")

times_increased = 0
last_window_reading = nil

while scanner.has_data? do
  current_window_reading = scanner.read_window.sum

  times_increased += 1 if !last_window_reading.nil? && current_window_reading > last_window_reading

  last_window_reading = current_window_reading
end

puts "Scanner readings increased a total of #{times_increased} times"
