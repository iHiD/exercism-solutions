class Clock
  MINS_PER_HOUR = 60
  MINS_PER_DAY = 1440

  def initialize(hour: 0, minute: 0)
    @time = (hour * MINS_PER_HOUR + minute) % MINS_PER_DAY
  end

  def to_s
    "%02d:%02d" % time.divmod(MINS_PER_HOUR)
  end

  def +(other)
    Clock.new(minute: time + other.time)
  end

  def -(other)
    Clock.new(minute: time - other.time)
  end

  def ==(other)
    time == other.time
  end
  alias :eql? :==

  protected
  attr_reader :time
end

module BookKeeping
  VERSION = 3
end
