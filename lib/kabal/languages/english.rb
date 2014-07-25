require 'kabal/languages/language'
require 'kabal/languages/english/natural_numbers'
require 'kabal/languages/english/fractional_numbers'

class Kabal::English < Kabal::Language
  include Kabal::EnglishRules::NaturalNumbers
  include Kabal::EnglishRules::FractionalNumbers
  def convert_number(number)
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
