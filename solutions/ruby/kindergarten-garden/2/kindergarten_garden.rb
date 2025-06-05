class Garden
  CHILDREN = %w[
    Alice Bob Charlie David
    Eve Fred Ginny Harriet
    Ileana Joseph Kincaid Larry
  ].map(&:downcase)

  SEEDS = %i[clover grass radishes violets].map{|p|[p.to_s[0].upcase, p]}.to_h

  def initialize(rows)
    cups = rows.lines.map { |line| line.scan(/../) }.transpose
    CHILDREN.each.with_index do |name, idx|
      seeds = Array(cups[idx]).join.chars.map(&SEEDS)
      define_singleton_method(name) { seeds }
    end
  end
end
