class Year
  def self.leap?(year)
    return false unless year.modulo(4).zero?
    return true unless year.modulo(100).zero?
    year.modulo(400).zero?
  end
end
