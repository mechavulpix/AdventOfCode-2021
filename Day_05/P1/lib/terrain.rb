require_relative "segment"

class Terrain
  attr_accessor :terrain

  def initialize(rows:, columns:)
    @terrain = Array.new(rows) { Array.new(columns) { 0 } }
  end

  def add_segment(segment:)
    segment.as_point_array.each do |point|
      @terrain[point.y][point.x] += 1
    end
  end

  def get_overlap_point_total
    @terrain.flatten.count { |x| x > 1 }
  end

  def print_map
    @terrain.each do |row|
      puts row.join.gsub("0", ".")
    end
  end

end
