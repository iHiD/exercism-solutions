class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(width)
    raise SeriesLengthError.new if width > digits.size
    digits.chars.each_cons(width).map(&:join)
  end

  class SeriesLengthError < ArgumentError
    def intialize(message = "Slice size must not be larger than series length")
      super
    end
  end

  private
  attr_reader :digits
end
