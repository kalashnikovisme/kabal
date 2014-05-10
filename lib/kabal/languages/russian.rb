require 'kabal/languages/language'
require 'kabal/languages/russian/declinations'
require 'kabal/languages/russian/natural_numbers'
require 'kabal/languages/russian/fractional_numbers'

class Kabal::Russian < Kabal::Language
  include Kabal::RussianRules::NaturalNumbers
  include Kabal::RussianRules::FractionalNumbers

  def convert_number(number)
    #FIXME find better way
    @number_name = nil
    need_minus?(number) ? (minus + " " + number_words(-number)) : number_words(number)
  end

  def number_words(number)
    return natural_number_name number.round if natural? number
    fractional_number_name number if fractional? number
  end

  def need_minus?(number)
    number < 0
  end
end
