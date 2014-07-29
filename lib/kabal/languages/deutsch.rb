require 'kabal/languages/language'
require 'kabal/languages/deutsch/natural_numbers'
require 'kabal/languages/deutsch/declinations'

class Kabal::Deutsch < Kabal::Language
  include Kabal::DeutschRules::NaturalNumbers

  def convert(number)
    if need_minus? number
      minus + " " + number_words(-number)
    else
      number_words number
    end
  end

  def number_words(number)
    natural_number_name number.round if natural? number
  end
end
