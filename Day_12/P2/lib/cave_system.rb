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
    current_route << next_cave

    if (next_cave.label == END_CAVE)
      @routes << current_route
    else
      valid_next_caves = valid_next_caves(current_route, next_cave.neighbors.map{|c| @caves[c]})

      valid_next_caves.each do |next_cave|
        explore_routes(current_route: current_route.dup, next_cave: next_cave)
      end
    end
  end

  def valid_next_caves(current_route, next_caves)
    next_caves -= next_caves.select{|c| c.label == START_CAVE }
    if route_includes_revisit?(current_route)
      next_caves -= next_caves.select{|c| c.small? && current_route.map(&:label).include?(c.label)}
    end
    next_caves
  end

  def route_includes_revisit?(route)
    route.select(&:small?).group_by{|c| c.label}.values.map(&:count).max > 1
  end
end
