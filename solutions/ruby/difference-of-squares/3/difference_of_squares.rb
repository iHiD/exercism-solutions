class Squares
  def initialize(last)
    @last = last
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    natural_numbers.sum.abs2
  end

  def sum_of_squares
    natural_numbers.sum(&:abs2)
  end

  private
  attr_reader :last

  def natural_numbers
    1.upto(last)
  end
end

module BookKeeping
  VERSION = 4
end
