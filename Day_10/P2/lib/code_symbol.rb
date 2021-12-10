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
    code_symbol.closed_by == @symbol
  end

  def closed_by
    case @symbol
    when "("
      ")"
    when "["
      "]"
    when "{"
      "}"
    when "<"
      ">"
    else
      nil
    end
  end

  def autocomplete_score
    case @symbol
    when ")"
      1
    when "]"
      2
    when "}"
      3
    when ">"
      4
    else
      0
    end
  end

  def corrupt_score
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
