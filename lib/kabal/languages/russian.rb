require 'kabal/languages/language'
require 'kabal/languages/russian/declinations'
require 'kabal/languages/russian/natural_numbers'

class Kabal::Russian < Kabal::Language
  include Kabal::RussianFunctions::NaturalNumbers

  def convert(number)
    #FIXME find way to get min and max from yml file
    raise NumberOutRangeError.message if number <= -(10 ** 102) or number >= 10 ** 102
    #FIXME find better way
    @number_name = nil
    need_minus?(number) ? (minus + " " + number_words(-number)) : number_words(number)
  end

  def number_words(number)
    return natural_number_name number if natural? number
    fractional_number_name number if fractional? number
  end

  def fractional_number_name(number)
  end

  def need_minus?(number)
    number < 0
  end
end
