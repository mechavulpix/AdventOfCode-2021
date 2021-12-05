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

last_winning_board_score = nil

while !loaded_numbers.empty? do
  last_drawn_number = loaded_numbers.shift
  winnning_boards = []

  boards.each do |board|
    board.mark_value(value: last_drawn_number)

    if board.has_win?
      winnning_boards << board
    end
  end

  if !winnning_boards.empty?
    boards = boards - winnning_boards
    last_winning_board_score = winnning_boards.map{|board| board.winning_score(multiplier: last_drawn_number)}.min
  end
end


puts "The last board to win had a score of #{last_winning_board_score}"
