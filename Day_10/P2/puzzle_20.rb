#!/usr/bin/env ruby
require_relative 'lib/line'
require_relative 'lib/code_symbol'

data_file = File.open("Day_10/input_10.txt", 'r')

lines = []
until data_file.eof? do
  lines << Line.new(line: data_file.readline.strip)
end

completion_scores = lines.select(&:incomplete?).map{ |c| c.completion_score }.sort
middle_completion_score = completion_scores[(completion_scores.length/2)]

puts "The middle completion score is #{middle_completion_score}"
