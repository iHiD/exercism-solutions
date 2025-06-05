=begin
Write your code for the 'Parallel Letter Frequency' exercise in this file. Make
the tests in `parallel_letter_frequency_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/parallel_letter_frequency` directory.
=end

class ParallelLetterFrequency
  def self.count(texts)
    new(texts).count
  end

  def initialize(texts)
    @texts = texts
    @ractors = []
    @tally = Hash.new(0)
  end

  def count
    setup_ractors!
    tally_next_ractor! until ractors.empty?

    tally
  end

  # Set up ractors for tallying each text
  def setup_ractors!
    @ractors = texts.map do |text|
      Ractor.new(text) do |text|
        text.downcase.chars.reject { |c| IGNORE.include?(c) }.tally
      end
    end
  end

  def tally_next_ractor!
    ractor, result = Ractor.select(*ractors)
    ractors.delete(ractor)

    result.each { |letter, count| tally[letter] += count }
  end

  private
  attr_reader :texts, :ractors, :tally

  IGNORE = %W[\r \t \n \s ! ? ; , . - — ’ ' " / : { } [ ] ( ) 1 2 3 4 5 6 7 8 9 0].freeze
  Ractor.make_shareable(IGNORE)
  private_constant :IGNORE
end
