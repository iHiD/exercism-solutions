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
    sorted_scores.first(3)
  end

  def report
    recent = scores.last
    top = sorted_scores.first

    info = recent == top ?
      "That's your personal best!" :
      "That's #{top - recent} short of your personal best!"

    "Your latest score was #{recent}. " + info
  end

  private

  def sorted_scores
    @sorted_scores ||= scores.sort.reverse
  end
end

