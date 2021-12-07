#!/usr/bin/env ruby
require_relative "lib/crab_group"

data_file = File.open("Day_07/input_07.txt", 'r')
starting_positions = data_file.readline.strip.split(",").map(&:to_i)

crab_groups = {}

starting_positions.uniq.each do |position|
  crab_groups[position] = [ CrabGroup.new(crabs: starting_positions.count(position)) ]
end

fuel_spent = 0
while crab_groups.length > 1 do
  min_pos = crab_groups.keys.min
  max_pos = crab_groups.keys.max
  cost_to_move_min = crab_groups[min_pos].map(&:cost_to_move).sum
  cost_to_move_max = crab_groups[max_pos].map(&:cost_to_move).sum

  merge_pos = nil
  remove_pos = nil
  if (cost_to_move_min <= cost_to_move_max)
    crabs_moving = crab_groups[min_pos]
    fuel_spent += cost_to_move_min
    merge_pos = min_pos + 1
    remove_pos = min_pos
  else
    crabs_moving = crab_groups[max_pos]
    fuel_spent += cost_to_move_max
    merge_pos = max_pos - 1
    remove_pos = max_pos
  end

  crabs_moving.each(&:move)

  if crab_groups.has_key?(merge_pos)
    crab_groups[merge_pos] += crabs_moving
  else
    crab_groups[merge_pos] = crabs_moving
  end

  crab_groups.delete(remove_pos)
end

puts "All crabs have been moved to position #{crab_groups.keys.first} at a cost of #{fuel_spent} fuel"
