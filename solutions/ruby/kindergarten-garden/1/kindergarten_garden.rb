class Garden
  CHILDREN = %w[
    Alice Bob Charlie David
    Eve Fred Ginny Harriet
    Ileana Joseph Kincaid Larry
  ].map(&:downcase)

  SEEDS = %i[clover grass radishes violets].map{|p|[p.to_s[0].upcase, p]}.to_h

  def initialize(rows)
    mapping = Hash.new {|h,c|h[c] = []}
    rows.lines.map do |row|
      row.chomp.chars.each_slice(2).with_index do |seeds, idx|
        mapping[CHILDREN[idx]] += seeds.map {|s| SEEDS[s]}
      end
    end

    mapping.each do |child, seeds|
      define_singleton_method(child) { seeds }
    end
  end
end
