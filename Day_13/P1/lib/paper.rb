require_relative 'instruction'

class Paper
  def initialize(dots:)
    max_x = dots.map(&:first).max + 1
    max_y = dots.map(&:last).max + 1

    @dots = Array.new(max_y) { Array.new(max_x) { 0 } }
    dots.each do |x,y|
      @dots[y][x] += 1
    end
  end

  def perform(instruction:)
    case instruction.orientation
    when "y"
      fold_up(y: instruction.position)
    when "x"
      fold_left(x: instruction.position)
    end
  end

  def total_visible_dots
    @dots.flatten.count(&:nonzero?)
  end

  def to_s
    @dots.map{|r| r.join(",")}.join("\n")
  end

  private

  def fold_up(y:)
    compacted = []
    @dots[...y].each{|row| compacted << row.dup}

    ((y+1)...@dots.length).step do |y_index|
      @dots[y_index].length.times do |x_index|
        folded_y = y_index - ( 2 * (y_index - y))
        compacted[folded_y][x_index] += @dots[y_index][x_index]
      end
    end

    @dots = compacted
  end

  def fold_left(x:)
    compacted = []
    @dots.each{ |row| compacted << row[...x].dup }

    ((x+1)...@dots.first.length).step do |x_index|
      @dots.length.times do |y_index|
        folded_x = x_index - ( 2 * (x_index - x))
        compacted[y_index][folded_x] += @dots[y_index][x_index]
      end
    end

    @dots = compacted
  end
end
