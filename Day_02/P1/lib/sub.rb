class Sub
  # depth is measured by distance from the surface, so distance below 0 is positive not negative
  attr_accessor :depth
  attr_accessor :horizon

  def initialize(depth: 0, horizon: 0)
    @depth = depth
    @horizon = horizon
  end

  def perform(command:)
    case command.directive
    when "forward"
      forward(distance: command.distance)
    when "up"
      up(distance: command.distance)
    when "down"
      down(distance: command.distance)
    end
  end

  def forward(distance:)
    @horizon += distance
  end

  def up(distance:)
    @depth -= distance
  end

  def down(distance:)
    @depth += distance
  end

  class Command
    attr_accessor :directive
    attr_accessor :distance

    def initialize(directive:, distance:)
      @directive = directive
      @distance = distance
    end

    def self.parse(command_string:)
      directive, distance = command_string.split(' ')

      return Command.new(directive: directive, distance: distance.to_i)
    end
  end
end
