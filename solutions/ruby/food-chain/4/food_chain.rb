class FoodChain
  def self.song
    new.song
  end

  attr_reader :song_info
  def initialize
    @song_info = SongInfo.new
  end

  def song
    song_info.meals.map { |meal| VerseBuilder.build(song_info, meal) }.join("\n")
  end
end

class SongInfo
  Meal = Struct.new(:animal, :comment, :action) do
    def animal_with_action
      action ? "#{animal} #{action}" : animal
    end
  end

  attr_reader :meals
  def initialize
    meal_data = [
      ["fly", "I don't know why she swallowed the fly. Perhaps she'll die."],
      ["spider", "It wriggled and jiggled and tickled inside her.", "that wriggled and jiggled and tickled inside her"],
      ["bird", "How absurd to swallow a bird!"],
      ["cat", "Imagine that, to swallow a cat!"],
      ["dog", "What a hog, to swallow a dog!"],
      ["goat", "Just opened her throat and swallowed a goat!"],
      ["cow", "I don't know how she swallowed a cow!"],
      ["horse", "She's dead, of course!"]
    ]

    @meals = meal_data.map { |d| Meal.new(d[0], d[1], d[2]) }
  end

  def first_meal?(meal)
    meals.index(meal) == 0
  end

  def last_meal?(meal)
    meals.index(meal) == meals.size - 1
  end

  def general_meal?(meal)
    !first_meal?(meal) && !last_meal?(meal)
  end

  def meal_and_causes(meal)
    meals[0, meals.index(meal) + 1].reverse
  end

  def cause_of_meal(meal)
    meals[meals.index(meal) - 1]
  end
end

class VerseBuilder
  def self.build(*args)
    new(*args).build
  end

  attr_reader :song_info, :verse_meal
  def initialize(song_info, verse_meal)
    @song_info = song_info
    @verse_meal = verse_meal
  end

  def build
    lines = []
    lines += initial_lines
    lines += other_lines if song_info.general_meal?(verse_meal)
    lines.join("\n") + "\n"
  end

  def initial_lines
    [
      "I know an old lady who swallowed a #{verse_meal.animal}.", 
      verse_meal.comment
    ]
  end

  def other_lines
    song_info.meal_and_causes(verse_meal).map do |meal|
      if song_info.first_meal?(meal)
        meal.comment
      else
        cause = song_info.cause_of_meal(meal)
        "She swallowed the #{meal.animal} to catch the #{cause.animal_with_action}."
      end
    end
  end
end