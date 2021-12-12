class Cave
  attr_accessor :label
  attr_accessor :neighbors

  def initialize(label:)
    @label = label
    @neighbors = []
  end

  def small?
    @small ||= /[[:upper:]]/.match(@label).nil?
  end

  def big?
    !small?
  end

  def add_neighbor(neighbor:)
    @neighbors << neighbor
  end

end
