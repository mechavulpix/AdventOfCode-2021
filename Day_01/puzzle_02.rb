#!/usr/bin/env ruby

FILENAME = "input_01.txt"

class Scanner
  def initialize(filename)
    @input = File.open(filename, 'r')
    @current_window = []
  end

  def more_data?
    !@input.eof?
  end

  def next_reading
    read_data

    return @current_window.sum if full_window?

    return nil
  end

  private

  def full_window?
    @current_window.size == 3
  end

  def read_data
    @current_window.shift if full_window?

    while more_data? && !full_window? do
      @current_window << @input.readline.to_i
    end
  end
end

scanner = Scanner.new(FILENAME)

last_reading = nil
times_increased = 0

while scanner.more_data? do
  current_reading = scanner.next_reading

  puts current_reading

  times_increased += 1 if !last_reading.nil? && current_reading > last_reading

  last_reading = current_reading
end

puts "Readings increased a total of #{times_increased} times"
