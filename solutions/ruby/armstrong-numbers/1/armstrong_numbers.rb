class ArmstrongNumbers
  def self.include?(number)
    num_digits = number.digits.size
    number.digits.sum {|d| d**num_digits } == number
  end
end