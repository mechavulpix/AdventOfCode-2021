class Digit

  attr_accessor :segments

  def initialize(segments:)
    @segments = segments.chars
  end

  def one?
    @segments.length == 2
  end

  def four?
    @segments.length == 4
  end

  def seven?
    @segments.length == 3
  end

  def eight?
    @segments.length == 7
  end

  def two_three_or_five?
    @segments.length == 5
  end

  def six_nine_or_zero?
    @segments.length == 6
  end
end
