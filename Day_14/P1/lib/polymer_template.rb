class PolymerTemplate
  def initialize(starting_template:, insertion_rules:)
    @template = starting_template
    @insertion_rules = {}
    insertion_rules.each do |pair, addition|
      @insertion_rules[pair] = addition
    end
  end

  def perform_insertion_step
    pair_index = 0
    @template.length.times do
      current_pair = @template[pair_index, 2].join
      if @insertion_rules.has_key?(current_pair)
        pair_index += 1
        @template.insert(pair_index, @insertion_rules[current_pair])
      end
      pair_index += 1
    end
  end

  def most_common
    group_elements.max_by{ |elem, quantity| quantity }
  end

  def least_common
    group_elements.min_by{ |elem, quantity| quantity }
  end

  def to_s
    @template.join
  end

  private

  def group_elements
    @template.uniq.map{ |elem| [elem, @template.count(elem)] }
  end
end
