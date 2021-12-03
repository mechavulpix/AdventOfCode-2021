class DiagnosticAnalyzer
  def initialize(report_file:)
    @diagnostic_data = []
    parse_report(report: File.open(report_file, 'r'))
  end

  def gamma_rate
    @gamma ||= calculate_gamma_rate
  end

  def epsilon_rate
    @epsilon ||= calculate_epsilon_rate
  end

  def power_consumption
    @power_consumption ||= gamma_rate * epsilon_rate
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
      gamma << @diagnostic_data.map{ |row| row[position] }.tally.max_by{|k,v| v}.first
    end

    gamma.to_i(2)
  end

  def calculate_epsilon_rate
    epsilon = ""
    @diagnostic_data.first.length.times do |position|
      epsilon << @diagnostic_data.map{ |row| row[position] }.tally.min_by{|k,v| v}.first
    end

    epsilon.to_i(2)
  end
end
