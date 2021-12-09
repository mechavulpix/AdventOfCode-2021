class SevenSegmentCypher
  def initialize(all_digits:)
    @all_digits = all_digits
    determine_segment_positions
  end

  def decypher_digit(digit:)
    return "1" if digit.one?
    return "4" if digit.four?
    return "7" if digit.seven?
    return "8" if digit.eight?

    if digit.two_three_or_five?
      return "2" if digit.segments.include? @bottom_left
      return "5" if digit.segments.include? @top_left
      return "3"
    end

    if digit.six_nine_or_zero?
      return "0" unless digit.segments.include? @center
      return "6" if digit.segments.include? @bottom_left
      return "9"
    end

    return nil  # error state
  end

  private

  def determine_segment_positions
    six_nine_zero = @all_digits.select(&:six_nine_or_zero?)
    two_three_five = @all_digits.select(&:two_three_or_five?)

    one = @all_digits.find(&:one?)
    four = @all_digits.find(&:four?)
    seven = @all_digits.find(&:seven?)
    eight = @all_digits.find(&:eight?)

    nine = six_nine_zero.find{ |x| (four.segments - x.segments).empty? }
    six = six_nine_zero.find{ |x| !(seven.segments - x.segments).empty? }
    zero = (six_nine_zero - [six, nine]).first
    three = two_three_five.find{ |x| (one.segments - x.segments).empty? }

    @bottom_left = (eight.segments - nine.segments).first
    @top_left = (nine.segments - three.segments).first
    @center = (eight.segments - zero.segments).first
  end

end
