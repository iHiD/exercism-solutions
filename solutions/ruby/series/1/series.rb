class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(width)
    num_digits = digits.size
    raise SeriesLengthError.new if width > num_digits
    num_slices = (num_digits - (width - 1))
    num_slices.times.map { |i| digits[i,width] }
  end

  class SeriesLengthError < ArgumentError
    def intialize(message = "Slice size must not be larger than series length")
      super
    end
  end

  private
  attr_reader :digits
end
