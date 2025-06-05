module Acronym
  def self.abbreviate(string)
    string.scan(/\b[[:alpha:]]/).join.upcase
  end
end
