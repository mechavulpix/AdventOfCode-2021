class LowPoint
  def initialize(x:, y:, height:)
    @x = x
    @y = y
    @height = height
  end

  def risk_level
    @height + 1
  end
end
