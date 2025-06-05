module PigLatin

  def self.translate(phrase)
    phrase.split.map { |word| Translator.translate(word) }.join(" ")
  end

  class Translator
    def self.translate(word)
      new(word).translate
    end

    def initialize(word)
      @word = word
    end

    def translate
      case
      when starts_with_vowel_and_qu?
        word
      when starts_with_vowel?
        word + "ay"
      else
        first_sound = word[FIRST_SOUND]
        word[first_sound.length..-1] + first_sound + "ay"
      end
    end

    private
    attr_reader :word

    def starts_with_vowel_and_qu?
      starts_with_vowel? && !word[1,2] == "qu"
    end

    def starts_with_vowel?
      word.start_with?(*VOWEL_SOUNDS)
    end

    VOWEL_SOUNDS = %w{a e i o u xr yt}
    CONSONANT_SOUNDS = %w{ch squ qu thr th sch yt rh} + ('a'..'z').to_a - VOWEL_SOUNDS
    FIRST_SOUND = /^#{CONSONANT_SOUNDS.join("|")}/

    private_constant :VOWEL_SOUNDS, :CONSONANT_SOUNDS, :FIRST_SOUND
  end
end
