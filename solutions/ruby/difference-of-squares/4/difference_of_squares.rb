class Squares
  def initialize(last)
    @natural_numbers = 1.upto(last)
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
  attr_reader :natural_numbers
end
