class Instruction
  attr_accessor :position
  attr_accessor :orientation

  def initialize(instruction_string:)
    action, description, location = instruction_string.split(" ")
    @orientation, @position = location.split("=")
    @position = @position.to_i
  end
end
