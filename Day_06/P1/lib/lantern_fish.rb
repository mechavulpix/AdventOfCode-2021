class LanternFish

  BIRTH_STAGE = 8
  CYCLE_STAGES = 6

  def initialize(starting_stage: BIRTH_STAGE)
    @stage = starting_stage
  end

  def age
    children = []

    if (@stage == 0)
      @stage = CYCLE_STAGES
      children << LanternFish.new
    else
      @stage -= 1
    end

    children
  end
end
