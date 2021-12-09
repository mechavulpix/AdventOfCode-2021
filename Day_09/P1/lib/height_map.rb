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

        neighbors = get_neighbors(x: x, y: y)

        if neighbors.select{ |n| n <= current_height }.empty?
          low_points << LowPoint.new(x: x, y: y, height: current_height)
        end
      end
    end

    return low_points
  end

  private

  def get_neighbors(x:, y:)
    neighbors = []
    neighbors << @heights[y][x-1] if x > 0
    neighbors << @heights[y][x+1] if x < @columns - 1
    neighbors << @heights[y-1][x] if y > 0
    neighbors << @heights[y+1][x] if y < @rows - 1

    return neighbors
  end

end
