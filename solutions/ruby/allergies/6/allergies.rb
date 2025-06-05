class Allergies
  ALLERGENS = %w[
    eggs peanuts shellfish strawberries tomatoes chocolate pollen cats
  ].map.with_index {|a, idx| [a, (1 << idx)]}.reverse.freeze

  def initialize(score)
    @list = ALLERGENS.each.reduce([]) do |res, (name, flag)|
      score & flag == flag ? res.prepend(name) : res
    end
  end
  attr_reader :list

  def allergic_to?(allergen)= list.include?(allergen)
end
