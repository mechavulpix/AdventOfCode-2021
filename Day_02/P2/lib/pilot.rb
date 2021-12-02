require_relative "sub"

class Pilot
  def initialize(directions_file:)
    @directions = File.open(directions_file, 'r')
  end

  def has_directions?
    !@directions.eof?
  end

  def perform_next_direction(sub:)
    direction = read_direction
    command = Sub::Command.parse(command_string: direction)

    sub.perform(command: command)
  end

  private

  def read_direction
    direction = @directions.readline if has_directions?
  end
end
