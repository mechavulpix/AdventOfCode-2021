class CrabGroup
  def initialize(crabs:)
    @crabs = crabs
    @cost_multiplier = 1
  end

  def move
    @cost_multiplier += 1
  end

  def cost_to_move
    @crabs * @cost_multiplier
  end
end
