# Implement a class, `Oib`, that represents one OIB number.
#
# On instantiation `Oib` constructor will be called with an oib number(a string). Constructor should
# store the code and perform initial validation of code length and code format(all characters should
# be digits). If any of the preceding constraints are not met, the constructor should raise an
# `ArgumentError` exception with appropriate message:
#   - when the code is shorter than 11 characters, `Code is too short`
#   - when the code is longer than 11 characters, `Code is too long`
#   - when the code contains characters besides digits, `Code should contain only digits`
#
# Oib class should also expose one public method, `Oib#valid?`, which checks whether code satisfies
# mathematical properties for valid OIB number(is control digit correct or not).
#
# Procedure for calculating control code is described in
#   https://regos.hr/app/uploads/2018/07/KONTROLA-OIB-a.pdf

class Oib

    def initialize( oib )
        if oib.chars().count < 11
            raise ArgumentError.new "Code is too short"
        elsif oib.chars().count > 11
            raise ArgumentError.new "Code is too long"
        elsif oib.scan(/\D/).empty?
            @oibNumber = oib
        else
            raise ArgumentError.new "Code should contain only digits"
        end

    end

    def valid?

        if @oibNumber.chars().count == 11
            @zero = 0
        end

        if @oibNumber.chars().count == 1
            @control = 11 - @zero == 10 ? 0 : 11 - @zero
            @control == @oibNumber.chr.to_i
        else
            @middle = (@oibNumber.chr.to_i + @zero + 10) % 10

            @nonZeroMiddle = @middle == 0 ? 10 : @middle

            @zero = @nonZeroMiddle * 2 % 11

            @oibNumber.slice!(0)
            valid?
        end
    end
end
