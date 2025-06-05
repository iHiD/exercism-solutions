class Matrix
  attr_reader :rows
  def initialize(matrix_as_string)
    @rows = matrix_as_string.each_line.map {|line| line.split.map(&:to_i)}
  end

  def columns
    rows.transpose
  end
end
