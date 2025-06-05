class Proverb

  STANDARD_LINE = "For want of a %s the %s was lost."
  CLOSING_LINE = "And all for the want of a %s."

  def initialize(*objects, qualifier: nil)
    @objects = objects
    @qualifier = qualifier
  end

  def to_s
    lines.join("\n")
  end

  private
  attr_reader :objects, :qualifier

  def lines
    [
      *objects.each_cons(2).map { |desire, loss| STANDARD_LINE % [desire, loss] },
      CLOSING_LINE % source_problem
    ]
  end

  def source_problem
    [qualifier, objects.first].compact.join(" ")
  end
end
