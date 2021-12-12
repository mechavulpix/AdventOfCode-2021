require_relative 'cave'

class CaveSystem
  START_CAVE = "start"
  END_CAVE = "end"

  def initialize(tunnels:)
    @caves = {}
    tunnels.each do |tunnel|
      start, finish = tunnel.split("-")

      @caves[start] = Cave.new(label: start) unless @caves.has_key?(start)
      @caves[finish] = Cave.new(label: finish) unless @caves.has_key?(finish)

      @caves[start].add_neighbor(neighbor: finish)
      @caves[finish].add_neighbor(neighbor: start)
    end
  end

  def build_all_routes
    @routes = []
    explore_routes(current_route: [], next_cave: @caves[START_CAVE])
    @routes
  end

  private

  def explore_routes(current_route:, next_cave:)
    current_route << next_cave.label

    if (next_cave.label == END_CAVE)
      @routes << current_route
    else
      valid_next_caves = next_cave.neighbors.map{|c| @caves[c]}
      valid_next_caves -= valid_next_caves.select{|c| c.small? && current_route.include?(c.label)}

      valid_next_caves.each do |next_cave|
        explore_routes(current_route: current_route.dup, next_cave: next_cave)
      end
    end
  end

  # def explore_routes(current_route:, next_caves:)
  #   valid_steps = next_caves.map{|c| @caves[c]}
  #   valid_steps -= valid_steps.select{|c| c.small? && current_route.include?(c.label)}
  #   puts "@#{current_route.join("-")} valid-moves: #{valid_steps.map(&:label).join(",")}"
  #   valid_steps.each do |next_step|
  #     current_route << next_step.label
  #     if next_step.label == END_CAVE
  #       puts "** #{current_route.join("-")} **"
  #       @routes << current_route.dup
  #     else
  #       explore_routes(current_route: current_route.dup, next_caves: next_step.neighbors)
  #     end
  #   end
  # end
end
