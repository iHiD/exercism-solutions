class Allergies
  FOOD_SIGNALS = {
    'eggs' => 1,
    'peanuts' => 2,
    'shellfish' => 4,
    'strawberries' => 8,
    'tomatoes' => 16,
    'chocolate' => 32,
    'pollen' => 64,
    'cats' => 128
  }
  private_constant :FOOD_SIGNALS

  def initialize(signal)
    @signal = signal
  end

  def allergic_to?(food)
      reaction?(FOOD_SIGNALS[food])
  end

  def list
    FOOD_SIGNALS.select {|_, fs| reaction?(fs) }.keys
  end

  private
  attr_reader :signal

  def reaction?(food_signal)
    food_signal & signal > 0
  end
end
