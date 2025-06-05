class Luhn
  def self.valid?(*args)
    new(*args).valid?
  end

  def valid?
    return false if id_code =~ NOT_NUMERIC_OR_SPACE
    return false if digits.length <= 1
    total % 10 == 0
  end

  private
  attr_reader :id_code
  def initialize(id_code)
    @id_code = id_code
  end

  def total
    digits.reverse.each_slice(2).inject(0) do |sum, (d1,d2)|
      sum + d1 + (d2.to_i * 2).divmod(10).sum
    end
  end

  def digits
    @digits ||= id_code.delete(" ").each_char.map(&:to_i)
  end

  NOT_NUMERIC_OR_SPACE = /[^0-9 ]/
  private_constant :NOT_NUMERIC_OR_SPACE
end

