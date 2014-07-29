require 'kabal/languages/language'
require 'kabal/languages/deutsch/natural_numbers'

class Kabal::Deutsch < Kabal::Language
  include Kabal::DeutschRules::NaturalNumbers

  def convert(number)
    number_words number
  end

  def number_words(number)
    natural_number_name number.round if natural? number
  end
end
