

class Board
  def self.transform(*args)
    new(*args).transform
  end

  def initialize(input)
    @rows = []
    input.each.with_index do |line, line_idx|
      line.chars.each.with_index do |cell, cell_idx|
        @rows[line_idx] ||= []
        @rows[line_idx][cell_idx] = Cell.new(cell)
      end
    end

    check_board!
  end

  def transform
    transformed_cells = rows.map.with_index do |row, row_idx|
      row.map.with_index { |cell, cell_idx|
        if cell.transform?
          count = 0
          count += 1 if cell_at(row_idx, cell_idx - 1).mine?
          count += 1 if cell_at(row_idx, cell_idx + 1).mine?
          count += 1 if cell_at(row_idx - 1, cell_idx).mine?
          count += 1 if cell_at(row_idx - 1, cell_idx - 1).mine?
          count += 1 if cell_at(row_idx - 1, cell_idx + 1).mine?
          count += 1 if cell_at(row_idx + 1, cell_idx).mine?
          count += 1 if cell_at(row_idx + 1, cell_idx - 1).mine?
          count += 1 if cell_at(row_idx + 1, cell_idx + 1).mine?
          count == 0 ? " " : count
        else
          cell.value
        end
      }.join
    end
  end

  private
  attr_reader :rows

  def check_board!
    correct_length = rows.first.length
    rows.each do |row|
      raise ArgumentError.new unless row.length == correct_length
      raise ArgumentError.new unless row.first.value =~ /[\+|]/
      raise ArgumentError.new unless row.last.value =~ /[\+|]/
      raise ArgumentError.new unless row.all? {|c| c.valid?}
    end
  end

  def cell_at(row, pos)
    row = rows[row]
    cell = row[pos] if row
    cell || NullCell.new
  end

  class Cell
    attr_reader :value
    def initialize(value)
      @value = value
    end

    def mine?
      value == "*"
    end

    def transform?
      value == " "
    end

    def valid?
      value != "X"
    end
  end

  class NullCell
    def mine?
      false
    end
  end
end
