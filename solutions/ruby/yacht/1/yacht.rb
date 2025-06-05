class Yacht
  def initialize(rolls, category)
    @rolls = rolls.sort
    @category = category
    @tally = rolls.tally.sort_by(&:last).to_h
  end

  def score
    case category
      in 'choice' then rolls.sum
      in 'ones'   then rolls.count(1)
      in 'twos'   then rolls.count(2) * 2
      in 'threes' then rolls.count(3) * 3
      in 'fours'  then rolls.count(4) * 4
      in 'fives'  then rolls.count(5) * 5
      in 'sixes'  then rolls.count(6) * 6

      in 'little straight' if rolls == (1..5).to_a    then 30 
      in 'big straight'    if rolls == (2..6).to_a    then 30 
      in 'four of a kind'  if tally.values.last >= 4  then tally.keys.last * 4
      in 'full house'      if tally.values == [2, 3]  then rolls.sum
      in 'yacht'           if tally.values == [5]     then 50

      else 0
    end
  end
  
  private
  attr_reader :rolls, :category, :tally
end