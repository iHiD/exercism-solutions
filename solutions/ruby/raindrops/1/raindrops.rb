require 'prime'

class Raindrops
  SOUNDS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}.freeze

  def self.convert(num)
    new(num).convert
  end

  attr_reader :num
  def initialize(num)
    @num = num
  end

  def convert
    output = factors.map {|f| SOUNDS[f] }.compact.join
    output.empty?? num.to_s : output
  end

  private
  def factors
    num.prime_division.map(&:first)
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
