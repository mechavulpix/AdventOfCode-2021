require_relative 'code_symbol'

class Line
  attr_accessor :illegal_symbol

  def initialize(line:)
    validate_syntax(line: line)
  end

  def corrupt?
    !@illegal_symbol.nil?
  end

  private

  def validate_syntax(line:)
    @open_chunks = []
    symbols_remaining = line.chars.map{|c| CodeSymbol.new(symbol: c)}

    while illegal_symbol.nil? && !symbols_remaining.empty?
      current = symbols_remaining.shift

      if current.chunk_opener?
        @open_chunks << current
      else
        if current.chunk_closer?
          if current.closes(code_symbol: @open_chunks.last)
            @open_chunks.pop
          else
            @illegal_symbol = current
          end
        end
      end
    end
  end
end
