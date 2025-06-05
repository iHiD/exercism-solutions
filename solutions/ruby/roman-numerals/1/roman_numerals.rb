class Integer
  def to_roman
    pattern = Proc.new do |num, one, five, ten|
      case
      when num <= 3; one  * num             # III (num = 3)
      when num == 4; one  + five            # IV
      when num <= 8; five + one * (num - 5) # VII (num = 7)
      when num == 9; one  + ten             # IX
      end
    end
  
    return pattern.(self,        "I", "V", "X")                          if self < 10
    return pattern.(self / 10,   "X", "L", "C") + (self % 10).to_roman   if self < 100
    return pattern.(self / 100,  "C", "D", "M") + (self % 100).to_roman  if self < 1_000
    return pattern.(self / 1000, "M", "C", "")  + (self % 1000).to_roman
  end
end