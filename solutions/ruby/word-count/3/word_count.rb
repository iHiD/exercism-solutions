class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase.downcase.
           scan(/\b[\w']+\b/).
           each_with_object(Hash.new(0)) { |word, hsh| hsh[word] += 1}
  end

  private
  attr_reader :phrase
end
