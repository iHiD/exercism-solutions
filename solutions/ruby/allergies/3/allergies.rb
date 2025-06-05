class Allergies
  ALLERGENS = %w[
    eggs peanuts shellfish strawberries tomatoes chocolate pollen cats
  ].map.with_index {|allergen, idx| [allergen, (1 << idx)]}.reverse

  def initialize(score)
    @list = generate_list(score)
  end
  attr_reader :list

  def generate_list(score)
    ALLERGENS.each.reduce([]) do |result, (allergen, id)|
      score & id == id ? result.prepend(allergen) : result
    end.uniq
  end

  def allergic_to?(allergen)= list.include?(allergen)
end

