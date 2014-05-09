require 'kabal/languages/language'
require 'kabal/languages/russian/declinations'
require 'kabal/languages/russian/natural_numbers'
require 'kabal/languages/russian/fractional_numbers'

class Kabal::Russian < Kabal::Language
  include Kabal::RussianRules::NaturalNumbers
  include Kabal::RussianRules::FractionalNumbers

  def convert(number)
    #FIXME find way to get min and max from yml file
    raise NumberOutRangeError.message if number <= -(10 ** 102) or number >= 10 ** 102
    #FIXME find better way
    @number_name = nil
    need_minus?(number) ? (minus + " " + number_words(-number)) : number_words(number)
  end

  def number_words(number)
    return natural_number_name number.round if natural? number
    fractional_number_name number if fractional? number
  end

  def natural_number_name(number)
    #FIXME switch case next lines
    return single(number) if number >= 0 and number <= 19
    return two_words(number) if number >= 20 and number <= 99
    return three_words(number) if number >= 100 and number <= 999
    ten_powers(number) if number >= 1000
  end

  def natural?(number)
    number % 1 == 0
  end
  def need_minus?(number)
    number < 0
  end
end
