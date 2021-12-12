#!/usr/bin/env ruby
require_relative 'lib/cave_system'

data_file = File.open("Day_12/input_12.txt", 'r')

tunnels = []
until data_file.eof? do
  tunnels << data_file.readline.strip
end

cave_system = CaveSystem.new(tunnels: tunnels)
routes = cave_system.build_all_routes

puts "There are #{routes.length} total routes."
