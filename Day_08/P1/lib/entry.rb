require_relative("digit")

class Entry
  attr_accessor :ten_patterns

  def initialize(input_string:)
    parts = input_string.split("|")
    @ten_patterns = parts[0].split(" ")
    @raw_four_digits = parts[1].split(" ")
  end

  def four_digits
    @four_digits ||= convert_raw_four_digits
  end

  def count_one_four_seven_eight_digits
    four_digits.count(&:one_four_seven_or_eight?)
  end

  private

  def convert_raw_four_digits
    @raw_four_digits.map { |d| Digit.new(segments: d) }
  end
end
