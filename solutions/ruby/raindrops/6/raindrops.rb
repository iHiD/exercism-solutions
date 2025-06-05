module Raindrops
  SOUNDS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}.freeze

  def self.convert(num)
    rhythm = SOUNDS.select{ |key, sound| num % key == 0}.values
    rhythm.present? ? rhythm.join : num.to_s
  end
end
