class MultiKeyHash
  def initialize(hash)
      @exploded = hash.reduce([]) do |arr, (letters, value)|
        arr + letters.product([value])
      end.to_h
    end

  def [](key) = @exploded[key]
end

class Scrabble
  LETTERS = MultiKeyHash.new(
    %w[A E I O U L N R S T] => 1,
    %w[D G]                 => 2,
    %w[B C M P]             => 3,
    %w[F H V W Y]           => 4,
    %w[K]                   => 5,
    %w[J X]                 => 8,
    %w[Q Z]                 => 10
  )
  
  def initialize(letters)
    @score = letters.to_s.
               strip.upcase.chars.
               sum { |letter| LETTERS[letter] }
  end
  
  attr_reader :score
  private_constant :LETTERS
end