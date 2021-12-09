class Digit

  attr_accessor :segments

  def initialize(segments:)
    @segments = segments
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

  def one_four_seven_or_eight?
    one? || four? || seven? || eight?
  end
end
