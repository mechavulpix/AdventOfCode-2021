#!/usr/bin/env ruby

data_file = File.open("Day_07/input_07.txt", 'r')
starting_positions = data_file.readline.strip.split(",").map(&:to_i)

crab_groups = {}

starting_positions.each do |crab|
  crab_groups[crab] = 0 unless crab_groups.has_key?(crab)

  crab_groups[crab] += 1
end

fuel_spent = 0
while crab_groups.length > 1 do
  min_pos = crab_groups.keys.min
  max_pos = crab_groups.keys.max
  cost_to_move_min = crab_groups[min_pos]
  cost_to_move_max = crab_groups[max_pos]

  merge_pos = nil
  remove_pos = nil
  if (cost_to_move_min <= cost_to_move_max)
    crabs_moving = crab_groups[min_pos]
    merge_pos = min_pos + 1
    remove_pos = min_pos
  else
    crabs_moving = crab_groups[max_pos]
    merge_pos = max_pos - 1
    remove_pos = max_pos
  end

  if crab_groups.has_key?(merge_pos)
    crab_groups[merge_pos] += crabs_moving
  else
    crab_groups[merge_pos] = crabs_moving
  end

  fuel_spent += crabs_moving
  crab_groups.delete(remove_pos)
end

puts "All crabs have been moved to position #{crab_groups.keys.first} at a cost of #{fuel_spent} fuel"
