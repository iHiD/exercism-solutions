module Hamming
  def self.compute(s1, s2)
    raise ArgumentError unless s1.length == s2.length
    s1.chars.select.with_index { |c,idx| c != s2[idx]}.size
  end
end

module BookKeeping
  VERSION = 3
end
