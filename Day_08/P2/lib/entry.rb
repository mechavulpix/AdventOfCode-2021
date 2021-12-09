require_relative 'digit'
require_relative 'seven_segment_cypher'

class Entry
  attr_accessor :ten_patterns

  def initialize(input_string:)
    parts = input_string.split("|")
    @unique_digits = as_digits(raw_segments: parts[0].split(" "))
    @four_digits = as_digits(raw_segments: parts[1].split(" "))
  end

  def cypher
    @cypher ||= generate_cypher
  end

  def decypher_digits
    @four_digits.map { |d| cypher.decypher_digit(digit: d) }.join.to_i
  end


  private

  def as_digits(raw_segments:)
    raw_segments.map { |d| Digit.new(segments: d) }
  end

  def generate_cypher
    SevenSegmentCypher.new(all_digits: @unique_digits)
  end
end
