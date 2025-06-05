module Pangram
  def self.pangram?(sentence)
    sentence.downcase.
      scan(/[a-z]/).
      uniq.
      count == NUM_LETTERS_IN_ALPHABET
  end

  NUM_LETTERS_IN_ALPHABET = 26
end
