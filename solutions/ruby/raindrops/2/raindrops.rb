require 'prime'

module Raindrops
  SOUNDS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}.freeze

  def self.convert(num)
    factors = num.prime_division.map(&:first)
    rhythm = factors.map {|f| SOUNDS[f] }.compact.join
    rhythm.empty?? num.to_s : rhythm
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
