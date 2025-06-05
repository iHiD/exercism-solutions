class Array
  def accumulate
    map { |i| yield(i) }
  end
end
