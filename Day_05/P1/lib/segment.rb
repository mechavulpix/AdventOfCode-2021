class Segment

  def initialize(start_x:, start_y:, finish_x:, finish_y:)
    @start = Point.new(x: start_x, y: start_y)
    @finish = Point.new(x: finish_x, y: finish_y)

    @delta_x = (finish_x - start_x).abs
    @coefficient_x = (finish_x - start_x).negative? ? -1 : 1
    @delta_y = (finish_y - start_y).abs
    @coefficient_y = (finish_y - start_y).negative? ? -1 : 1
  end

  def orientation
    return :vertical if @start.x == @finish.x
    return :horizontal if @start.y == @finish.y
    return :diagonal
  end

  def max_x
    [@start.x, @finish.x].max
  end

  def max_y
    [@start.y, @finish.y].max
  end

  def as_point_array
    points = []

    if (orientation == :horizontal)
      points << @start
      @delta_x.times do |x|
        offset_x = (x + 1) * @coefficient_x
        points << Point.new(x: @start.x + offset_x, y: @start.y)
      end
    end

    if (orientation == :vertical)
      points << @start
      @delta_y.times do |y|
        offset_y = (y + 1) * @coefficient_y
        points << Point.new(x: @start.x, y: @start.y + offset_y)
      end
    end

    points
  end

  def self.parse(segment_string:)
    points = segment_string.split("->")
    start = points.first.strip.split(",")
    finish = points.last.strip.split(",")

    Segment.new(
      start_x: start.first.to_i,
      start_y: start.last.to_i,
      finish_x: finish.first.to_i,
      finish_y: finish.last.to_i)
  end

  private

  class Point
    attr_accessor :x
    attr_accessor :y

    def initialize(x:, y:)
      @x = x
      @y = y
    end
  end
end
