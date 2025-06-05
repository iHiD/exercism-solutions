class Phrase
  WORD_REGEXP = /\b[\w']+\b/

  def initialize(phrase)
    @words = phrase.downcase.scan(WORD_REGEXP)
  end

  def word_count
    words.each_with_object(Hash.new(0)) { |word, hsh| hsh[word] += 1}
  end

  private
  attr_reader :words
end
