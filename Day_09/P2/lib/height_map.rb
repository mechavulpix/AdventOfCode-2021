require_relative 'low_point'

class HeightMap
  def initialize(heights:)
    @heights = heights
    @rows = @heights.length
    @columns = @heights.first.length
  end

  def find_low_points
    low_points = []

    @rows.times do |y|
      @columns.times do |x|
        current_height = @heights[y][x].to_i

        neighbors = get_neighbor_locations(loc: Location.new(x, y))

        if neighbors.select{ |n| @heights[n.y][n.x] <= current_height }.empty?
          low_points << LowPoint.new(x: x, y: y, height: current_height)
        end
      end
    end

    return low_points
  end

  def determine_basin_size(low_point:)
    start = Location.new(low_point.x, low_point.y)
    basin = []

    spots_to_check = [ start ]

    until spots_to_check.empty? do
      location = spots_to_check.shift

      unless basin.include?(location.label) || @heights[location.y][location.x] == 9 # This is disingenuous, but we'll give it a go anyway
        basin << location.label
        spots_to_check += get_neighbor_locations(loc: location)
      end
    end

    basin.length
  end

  private

  def get_neighbor_locations(loc:)
    neighbors = []
    neighbors << Location.new(loc.x-1, loc.y) if loc.x > 0
    neighbors << Location.new(loc.x+1, loc.y) if loc.x < @columns - 1
    neighbors << Location.new(loc.x, loc.y-1) if loc.y > 0
    neighbors << Location.new(loc.x, loc.y+1) if loc.y < @rows - 1

    return neighbors
  end

  class Location
    attr_accessor :x
    attr_accessor :y

    def initialize(x, y)
      @x = x
      @y = y
    end

    def label
      "#{@x},#{@y}"
    end
  end
end
