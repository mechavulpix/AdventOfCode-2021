class Population

  BIRTH_COHORT = 8
  CYCLE_COHORT = 6

  private def initialize(starting_cohorts:)
    @all_cohorts = starting_cohorts
  end

  def population_size
    @all_cohorts.sum
  end

  def age_population
    current_cohort = @all_cohorts.shift

    @all_cohorts[CYCLE_COHORT] += current_cohort

    @all_cohorts << current_cohort
  end

  def self.create_from_ages(starting_population_ages:)
    starting_cohorts = Array.new(BIRTH_COHORT + 1) { 0 }
    (0..BIRTH_COHORT).step do |age|
      starting_cohorts[age] = starting_population_ages.count(age)
    end

    Population.new(starting_cohorts: starting_cohorts)
  end
end
