class ETL
  def self.transform(old)
    old.each_with_object({}) do |(score, keys), new|
      keys.each do |key|
        new[key.downcase] = score
      end
    end
  end
end
