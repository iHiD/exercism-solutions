module Acronym
  def self.abbreviate(phrase)
    phrase.scan(/\b[[:alpha:]]/).join.upcase
  end
end
