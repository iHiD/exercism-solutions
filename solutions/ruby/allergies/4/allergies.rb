class Allergies
  ALLERGENS = %w[
    eggs peanuts shellfish strawberries tomatoes chocolate pollen cats
  ].map.with_index {|allergen, idx| [allergen, (1 << idx)]}.reverse

  def initialize(score)
    @list = ALLERGENS.each.reduce([]) do |result, (allergen, id)|
      score & id == id ? result.prepend(allergen) : result
    end.uniq
  end
  attr_reader :list

  def allergic_to?(allergen)= list.include?(allergen)
end

