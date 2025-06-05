class Proverb

  STANDARD_LINE = "For want of a %s the %s was lost."
  CLOSING_LINE = "And all for the want of a %s."

  def initialize(*desires, qualifier: nil)
    @desires = desires
    @qualifier = qualifier
  end

  def to_s
    lines.join("\n")
  end

  private
  attr_reader :desires, :qualifier

  def lines
    [
      *desires.each_cons(2).map { |desire, loss| STANDARD_LINE % [desire, loss] },
      CLOSING_LINE % trigger
    ]
  end

  def trigger
    [qualifier, desires.first].compact.join(" ")
  end
end
