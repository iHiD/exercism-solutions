class HighScores

  attr_reader :scores
  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top
    scores.max(3)
  end

  def report
    modifier = "#{recent_shortfall} short of" if recent_shortfall > 0
    "Your latest score was #{latest}. That's #{modifier} your personal best!".squeeze
  end

  private

  def recent_shortfall
    @recent_shortfall ||= personal_best - latest
  end

  def sorted_scores
    @sorted_scores ||= scores.sort.reverse
  end
end

