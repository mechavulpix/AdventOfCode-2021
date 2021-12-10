#!/usr/bin/env ruby
require_relative 'lib/line'
require_relative 'lib/code_symbol'

data_file = File.open("Day_10/input_10.txt", 'r')

lines = []
until data_file.eof? do
  lines << Line.new(line: data_file.readline.strip)
end

corrupt_line_score = lines.select(&:corrupt?).map{ |c| c.illegal_symbol.score }.sum

puts "Total corrupt line error score is #{corrupt_line_score}"
