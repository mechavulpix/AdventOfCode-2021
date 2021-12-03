class DiagnosticAnalyzer
  def initialize(report_file:)
    @diagnostic_data = []
    parse_report(report: File.open(report_file, 'r'))
  end

  def power_consumption
    @power_consumption ||= gamma_rate * epsilon_rate
  end

  def gamma_rate
    @gamma ||= calculate_gamma_rate
  end

  def epsilon_rate
    @epsilon ||= calculate_epsilon_rate
  end

  def life_support_rating
    @life_support_rating ||= oxygen_generator_rating * c02_scrubber_rating
  end

  def oxygen_generator_rating
    @oxygen_generator_rating ||= calculate_oxygen_generator_rating
  end

  def c02_scrubber_rating
    @c02_scrubber_rating ||= calculate_c02_scrubber_rating
  end

  private

  def parse_report(report:)
    until report.eof?
      @diagnostic_data << report.readline.chars
    end
  end

  def calculate_gamma_rate
    gamma = ""
    @diagnostic_data.first.length.times do |position|
      gamma << calculate_gamma_at_position(data: @diagnostic_data, position: position)
    end

    gamma.to_i(2)
  end

  def calculate_gamma_at_position(data:, position:)
    totals = data.map{ |row| row[position] }.tally.max_by{|k,v| "#{v}#{k}".to_i}.first
  end

  def calculate_epsilon_rate
    epsilon = ""
    @diagnostic_data.first.length.times do |position|
      epsilon << calculate_epsilon_at_position(data: @diagnostic_data, position: position)
    end

    epsilon.to_i(2)
  end

  def calculate_epsilon_at_position(data:, position:)
    data.map{ |row| row[position] }.tally.min_by{|k,v| "#{v}#{k}".to_i}.first
  end

  def calculate_oxygen_generator_rating
    potential_values = @diagnostic_data.dup

    current_position = 0
    while potential_values.length > 1 && current_position < potential_values.first.length do
      desired_value = calculate_gamma_at_position(data: potential_values, position: current_position)
      potential_values.select!{|row| row[current_position] == desired_value}
      current_position += 1
    end

    potential_values.first.join.to_i(2)
  end

  def calculate_c02_scrubber_rating
    potential_values = @diagnostic_data.dup

    current_position = 0
    while potential_values.length > 1 && current_position < potential_values.first.length do
      desired_value = calculate_epsilon_at_position(data: potential_values, position: current_position)
      potential_values.select!{|row| row[current_position] == desired_value}
      current_position += 1
    end

    potential_values.first.join.to_i(2)
  end
end
