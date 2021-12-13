#!/usr/bin/env ruby
require_relative 'lib/paper'

data_file = File.open("Day_13/input_13.txt", 'r')

dots = []
instructions = []

input_line = data_file.readline.strip
until input_line.empty? do
  dots << input_line.split(",").map(&:to_i)
  input_line = data_file.readline.strip
end

until data_file.eof? do
  instructions << Instruction.new(instruction_string: data_file.readline.strip)
end

paper = Paper.new(dots: dots)

paper.perform(instruction: instructions.first)

puts "There are #{paper.total_visible_dots} dots visible"
