#!/usr/bin/env ruby
require_relative 'lib/diagnostic_analyzer'

analyzer = DiagnosticAnalyzer.new(report_file: "Day_03/input_03.txt")

puts "Gamma Rate: #{analyzer.gamma_rate}  Epsilon Rate: #{analyzer.epsilon_rate}"
puts "Power Consumption: #{analyzer.power_consumption}"
