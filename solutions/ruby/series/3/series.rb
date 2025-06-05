class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(width)
    raise ArgumentError.new if width > digits.size
    digits.chars.each_cons(width).map(&:join)
  end

  private
  attr_reader :digits
end
