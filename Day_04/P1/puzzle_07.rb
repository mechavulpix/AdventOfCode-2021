#!/usr/bin/env ruby
require_relative 'lib/board'

data_file = File.open("Day_04/input_04.txt", 'r')

loaded_numbers = data_file.readline.strip.split(',')

boards = []
current_board_spaces = []
until data_file.eof? do
  line = data_file.readline.strip

  if (line.empty?)
    boards << Board.new(spaces: current_board_spaces) unless current_board_spaces.empty?
    current_board_spaces = []
  else
    current_board_spaces << line.split(' ')
  end
end

last_drawn_number = nil
winning_boards = []

while winning_boards.empty? && !loaded_numbers.empty? do
  last_drawn_number = loaded_numbers.shift

  boards.each do |board|
    board.mark_value(value: last_drawn_number)

    winning_boards << board if board.has_win?
  end
end


puts "Found #{winning_boards.length} with a score of #{winning_boards.first.winning_score(multiplier: last_drawn_number)}"
