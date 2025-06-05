module Grains
  SQUARES = (1..64)

  def self.square(position)
    raise BoardPositionError unless SQUARES.cover?(position)
    2 ** (position - 1)
  end

  def self.total
    square(SQUARES.max) * 2 - 1
  end

  class BoardPositionError < ArgumentError
    def initialize(message = "This position doesn't exist on this board")
      super
    end
  end
end
