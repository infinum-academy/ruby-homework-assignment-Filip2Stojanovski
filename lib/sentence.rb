# Implement translator to Satrovacki slang. In order to generate `satro` representation of the word
# translator should split the word on the first vowel, and then reverse the order of split parts. If
# word is (strictly) less than 3 characters long, skip the conversion to `shatro`.
#
# Examples
#   +---------------+---------------+---------------+---------------+
#   |  first vowel  |      split    |    reverse    |     shatro    |
#   +---------------+---------------+---------------+---------------+
#   |     zdravo    |     zdra vo   |     vo zdra   |     vozdra    |
#   |        ^      |               |               |               |
#   +---------------+---------------+---------------+---------------+
#   |    betonske   |   be tonske   |   tonske be   |    tonskebe   |
#   |     ^         |               |               |               |
#   +---------------+---------------+---------------+---------------+
#
# Method will be called with a string which contains series of words separated by a space
# character(eg. "krpa krpa sava sava") and it should return a string where each word is converted to
# Satrovacki slang.
#
# Solve the task in an object-oriented style and meet these conditions:
#   1. create a Sentence class which accepts the user input
#      and exposes 1 public method `Sentence#to_shatro` and
#      the `Sentence#words` attribute reader
#   2. create a Word class which accepts only 1 word
#      and exposes 1 public method `Word#to_shatro`
#      the `Word#characters` attribute reader
#   3. create a Character class which accepts only 1 characters
#      and exposes 1 public method `Word#vowel?`

class Sentence

    def initialize ( s )
        @sentence = s
    end

    def to_shatro

        @shatro = ""

        @sentence.split.each { |w|
            @word = Word.new w.to_s
            if @shatro != ""
                @shatro.concat(" ")
                @shatro.concat(@word.to_shatro.to_s)
            else
                @shatro.concat(@word.to_shatro.to_s)
            end
        }
    end

end

class Word

    def initialize ( w )
        @word = w
    end

    def to_shatro
        if @word.chars().count < 3
            @word.downcase
        else
            @tmp = ""
            @word.chars().each { |c|
                @tmp.concat(c)
                @char = Character.new c

                if @char.vowel?
                    @word.slice! @tmp
                    return @word.concat(@tmp).downcase
                end
            }
        end
    end
end

class Character

    def initialize ( char )
        @character = char
    end

    def vowel?
        @character.downcase=="a" || @character.downcase=="e" || @character.downcase=="i" || @character.downcase=="o" || @character.downcase=="u"
    end
end

