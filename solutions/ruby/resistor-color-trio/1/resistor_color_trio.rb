class ResistorColorTrio

  def initialize(bands)
    @bands = bands
  end

  def label
    "Resistor value: #{value}"
  end

  private
  def value
    ohms < 1000 ? "#{ohms} ohms"
                : "#{ohms / 1000} kiloohms"
  end

  def ohms
    @ohms ||= begin
      value = bands[0,2].map{ |color| COLORS.index(color) }.join.to_i
      multiple = 10 ** (COLORS.index(bands[2]))
      value * multiple
    end
  end

  attr_reader :bands

  COLORS = %w{black brown red orange yellow green blue violet grey white}
  private_constant :COLORS
end

