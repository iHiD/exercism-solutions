class Transpose
  PAD_CHAR = "\u0080"
  EOL_PAD_CHARS = Regexp.new("[#{PAD_CHAR}]+$")

  def self.transpose(*args)
    new(*args).transpose
  end

  def transpose
    transposed_matrix.map(&method(:unpad)).join("\n")
  end

  private
  attr_reader :lines

  def initialize(input)
    @lines = input.lines.map(&:strip)
  end

  def transposed_matrix
    padded_lines.map(&:chars).transpose
  end

  def padded_lines
    max_length = lines.map{|l|l.strip.length}.max
    lines.map{|line|line.ljust(max_length, PAD_CHAR)}
  end

  def unpad(row)
    row.join.gsub(EOL_PAD_CHARS, '').tr(PAD_CHAR, ' ')
  end
end

