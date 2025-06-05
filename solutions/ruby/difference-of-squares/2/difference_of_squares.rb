class Squares
  def initialize(last)
    @last = last
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    (0..last).sum.abs2
  end

  def sum_of_squares
    (0..last).sum(&:abs2)
  end

  private
  attr_reader :last
end

module BookKeeping
  VERSION = 4
end
