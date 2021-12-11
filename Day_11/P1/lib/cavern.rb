require_relative 'octopus'

class Cavern
  def initialize(starting_energy:)
    @octopi = Array.new(starting_energy.length) { [] }
    starting_energy.each_with_index do |row, y|
      row.each_with_index do |energy, x|
        @octopi[y][x] = Octopus.new(energy: energy, x: x, y: y)
      end
    end

    @x_min = 0
    @x_max = @octopi.first.length - 1 # max index is 1 less than length
    @y_min = 0
    @y_max = @octopi.length - 1 # max index is 1 less than length
  end

  def step
    energize_all
    perform_flashes
    burnout
  end

  def count_all_flashes
    @octopi.flatten.map { |octopus| octopus.flashes }.sum
  end

  private

  def energize_all
    @octopi.flatten.each { |octopus| octopus.energize }
  end

  def perform_flashes
    octopi_to_flash = @octopi.flatten.select(&:ready_to_flash?)

    until octopi_to_flash.empty?
      octopi_to_flash.each do |octopus|
        octopus.flash(neighbors: get_valid_neighbors(octopus: octopus))
      end

      octopi_to_flash = @octopi.flatten.select(&:ready_to_flash?)
    end
  end

  def burnout
    @octopi.flatten.select(&:flashed?).each { |octopus| octopus.burnout }
  end

  def get_valid_neighbors(octopus:)
    octopus.neighbor_coordinates.select do |x,y|
      ((@x_min <= x && x <= @x_max) && (@y_min <= y && y <= @y_max))
    end.map{ |x,y| @octopi[y][x] }
  end


end
