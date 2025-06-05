class ETL
  def self.transform(old)
    old.invert.flat_map { |letters, score|
      letters.map(&:downcase).product([score])
    }.to_h
  end
end
