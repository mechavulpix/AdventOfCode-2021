#!/usr/bin/env ruby
require_relative 'lib/diagnostic_analyzer'

analyzer = DiagnosticAnalyzer.new(report_file: "Day_03/input_03.txt")

puts "Oxygen Generator Rating: #{analyzer.oxygen_generator_rating} C02 Scrubber Rating: #{analyzer.c02_scrubber_rating}"
puts "Life Support Rating: #{analyzer.life_support_rating}"
