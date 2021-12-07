require_relative "lantern_fish"

class Population
  def initialize(starting_population_stages:)
    @all_lantern_fish = []
    starting_population_stages.each do |start|
      @all_lantern_fish << LanternFish.new(starting_stage: start)
    end
  end

  def population_size
    @all_lantern_fish.length
  end

  def age_population
    new_fish = []
    @all_lantern_fish.each do |fish|
      new_fish += fish.age
    end

    @all_lantern_fish += new_fish
  end
end
