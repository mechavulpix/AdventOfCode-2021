class Octopus
  attr_accessor :flashes

  def initialize(energy:, x:, y:)
    @energy = energy
    @x = x
    @y = y
    @flashes = 0
    @flashing = false
  end

  def energize
    @energy += 1
  end

  def ready_to_flash?
    @energy > 9 && !@flashing
  end

  def flash(neighbors:)
    @flashes += 1
    @flashing = true
    neighbors.each { |n| n.energize}
  end

  def flashed?
    @energy >9 && @flashing
  end

  def burnout
    @energy = 0
    @flashing = false
  end

  def neighbor_coordinates
    neighbor_coordinates = [
      [@x-1,@y-1],[@x-1, @y ],[@x-1,@y+1],
      [ @x ,@y-1],            [ @x ,@y+1],
      [@x+1,@y-1],[@x+1, @y ],[@x+1,@y+1]
    ]
  end
end
