class Sub
  # depth is measured by distance from the surface, so distance below 0 is positive not negative
  # similarly, aiming up would be negative and aiming down would be positve
  attr_accessor :depth
  attr_accessor :horizon

  def initialize(depth: 0, horizon: 0, aim: 0)
    @depth = depth
    @horizon = horizon
    @aim = aim
  end

  def perform(command:)
    case command.directive
    when "forward"
      forward(amount: command.amount)
    when "up"
      up(amount: command.amount)
    when "down"
      down(amount: command.amount)
    end
  end

  def forward(amount:)
    @horizon += amount
    @depth += amount * @aim
  end

  def up(amount:)
    @aim -= amount
  end

  def down(amount:)
    @aim += amount
  end

  class Command
    attr_accessor :directive
    attr_accessor :amount

    def initialize(directive:, amount:)
      @directive = directive
      @amount = amount
    end

    def self.parse(command_string:)
      directive, amount = command_string.split(' ')

      return Command.new(directive: directive, amount: amount.to_i)
    end
  end
end
