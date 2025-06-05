class TwelveDays
  def self.song
    12.times.map { |idx|
      STORY_LINE % [ORDINALS[idx], items_for_line(idx)]
    }.join("\n")
  end

  def self.items_for_line(line)
    items = ITEMS[0, line + 1].reverse
    items[line] = "and #{items.last}" if line > 0
    items.join(", ")
  end

  STORY_LINE = "On the %s day of Christmas my true love gave to me: %s.\n"
  ORDINALS = %w{first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth}
  ITEMS = [
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ]
  private_constant :STORY_LINE, :ORDINALS, :ITEMS
end
