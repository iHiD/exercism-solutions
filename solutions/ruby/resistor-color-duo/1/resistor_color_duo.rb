module ResistorColorDuo

  def self.value(colors)
    colors[0,2].map{ |color| COLORS.index(color) }.join.to_i
  end

  COLORS = %w{black brown red orange yellow green blue violet grey white}
  private_constant :COLORS
end
