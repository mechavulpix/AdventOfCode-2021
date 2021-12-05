class Board
  def initialize(spaces:)
    @spaces = {}
    @wins = []
    @rows = spaces.length
    @columns = spaces.first.length
    spaces.each_with_index do |row, y|
      row.each_with_index do |value, x|
        @spaces[value] = Space.new(value: value, row: y, column: x)
      end
    end
  end

  def mark_value(value:)
    @spaces[value].mark if @spaces.has_key?(value)
  end

  def has_win?
    check_for_win

    !@wins.empty?
  end

  def winning_score(multiplier:)
    remaining_spaces = @spaces.values.select{|s| !s.marked?}
    total = remaining_spaces.map{ |s| s.value.to_i }.sum

    total * multiplier.to_i
  end

  private

  def check_for_win
    find_row_win
    find_column_win
  end

  def find_row_win
    @rows.times do |row|
      current_row = @spaces.values.select{|s| s.row == row }
      if current_row.map(&:marked?).count(true) == @columns
        @wins << current_row
      end
    end
  end

  def find_column_win
    @columns.times do |column|
      current_column = @spaces.values.select{|s| s.column == column }
      if current_column.map(&:marked?).count(true) == @rows
        @wins << current_column
      end
    end
  end

  class Space
    attr_accessor :value
    attr_accessor :row
    attr_accessor :column

    def initialize(value:, row:, column:)
      @value = value
      @row = row
      @column = column
      @marked = false
    end

    def mark
      @marked = true
    end

    def marked?
      @marked
    end
  end
end
