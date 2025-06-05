class Isogram
  def self.isogram?(phrase)
    chars = phrase.downcase.scan(/[a-z]/)
    chars.uniq == chars
  end
end
