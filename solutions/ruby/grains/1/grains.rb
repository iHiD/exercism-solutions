module Grains
  TOTAL_NUM_SQUARES = 64

  def self.square(num)
    raise ArgumentError unless (1..TOTAL_NUM_SQUARES).cover?(num)
    2 ** (num - 1)
  end

  def self.total
    square(TOTAL_NUM_SQUARES) * 2 - 1
  end
end

module BookKeeping
  VERSION = 1
end
