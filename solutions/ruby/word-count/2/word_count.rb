class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.gsub(/[,\s]/, ' ').
                    gsub(/[^\w\s']/, '').
                    downcase.
                    squeeze(" ").
                    split(" ").
                    map {|word| word.gsub(/^'(.*)'$/, '\1') }

    words.each_with_object(Hash.new(0)) { |word, hsh| hsh[word] += 1}
  end

  private
  attr_reader :phrase
end
