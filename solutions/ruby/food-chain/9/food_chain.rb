Meal = Struct.new(:animal, :comment, :qualifier) do
  def animal_with_qualifier
    [animal, qualifier].compact.join(" ")
  end
end

class FoodChain
  def self.song
    new.song
  end

  attr_reader :meals
  def initialize
    @meals = [
      Meal.new("fly", "I don't know why she swallowed the fly. Perhaps she'll die."),
      Meal.new("spider", "It wriggled and jiggled and tickled inside her.", "that wriggled and jiggled and tickled inside her"),
      Meal.new("bird", "How absurd to swallow a bird!"),
      Meal.new("cat", "Imagine that, to swallow a cat!"),
      Meal.new("dog", "What a hog, to swallow a dog!"),
      Meal.new("goat", "Just opened her throat and swallowed a goat!"),
      Meal.new("cow", "I don't know how she swallowed a cow!"),
      Meal.new("horse", "She's dead, of course!")
    ]
  end

  def song
    meals.map { |meal| VerseBuilder.build(meals, meal) }.join("\n")
  end
end

class VerseBuilder
  def self.build(*args)
    new(*args).build
  end

  INITIAL_LINE = "I know an old lady who swallowed a %s."
  CHAIN_LINE = "She swallowed the %s to catch the %s."

  attr_reader :meals, :meal
  def initialize(meals, meal)
    @meals = meals
    @meal = meal
  end

  def build
    (initial_lines + chain_lines).join("\n") + "\n"
  end

  def initial_lines
    [
      INITIAL_LINE % meal.animal,
      meal.comment
    ]
  end

  def chain_lines
    return [] unless has_chain_lines?

    meal_and_reasons.each_cons(2).map { |meal, reason|
      CHAIN_LINE % [meal.animal, reason.animal_with_qualifier]
    } + [meals.first.comment]

  end

  def has_chain_lines?
    idx = meals.index(meal)
    idx > 0 && idx < meals.size - 1
  end

  def meal_and_reasons
    meals[0..meals.index(meal)].reverse
  end
end