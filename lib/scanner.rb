class Scanner
  def initialize(filename:, window_size: 1)
    @input = File.open(filename, 'r')
    @window_size = window_size
    @current_window = []
  end

  def has_data?
    !@input.eof?
  end

  def read_window
    read_input

    return @current_window if current_window_filled?

    return nil
  end

  private

  def current_window_filled?
    @current_window.length >= @window_size
  end

  def read_input
    @current_window.shift if current_window_filled?

    while has_data? && !current_window_filled? do
      @current_window << @input.readline.to_i
    end
  end
end
