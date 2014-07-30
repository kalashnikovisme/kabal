require 'kabal/languages/language'
require 'kabal/languages/deutsch/natural_numbers'
require 'kabal/languages/deutsch/declinations'
require 'kabal/languages/deutsch/fractional_numbers'

class Kabal::Deutsch < Kabal::Language
  include Kabal::DeutschRules::NaturalNumbers
  include Kabal::DeutschRules::FractionalNumbers

  def convert(number)
    if need_minus? number
      minus + " " + number_words(-number)
    else
      number_words number
    end
  end

  def number_words(number)
    return natural_number_name number.round if natural? number
    fractional_number_name number if fractional? number
  end
end
