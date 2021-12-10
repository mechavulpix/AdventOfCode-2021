class CodeSymbol
  attr_accessor :symbol

  def initialize(symbol:)
    @symbol = symbol
  end

  def chunk_opener?
    ["(", "[", "{", "<"].include? @symbol
  end

  def chunk_closer?
    [")", "]", "}", ">"].include? @symbol
  end

  def closes(code_symbol:)
    case code_symbol.symbol
    when "("
      @symbol == ")"
    when "["
      @symbol == "]"
    when "{"
      @symbol == "}"
    when "<"
      @symbol == ">"
    else
      false
    end
  end

  def score
    case @symbol
    when ")"
      3
    when "]"
      57
    when "}"
      1197
    when ">"
      25137
    else
      0
    end
  end
end
