class Array
  def accumulate
    [].tap do |results|
      each { |i| results << yield(i) }
    end
  end
end
