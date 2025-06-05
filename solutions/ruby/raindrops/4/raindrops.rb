module Raindrops
  SOUNDS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}.freeze

  def self.convert(num)
    rhythm = SOUNDS.select{ |key, sound| num % key == 0}.values
    rhythm.empty?? num.to_s : rhythm.join
  end
end


module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end


