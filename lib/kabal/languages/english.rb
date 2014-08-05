require 'kabal/languages/language'
require 'kabal/languages/english/natural_numbers'
require 'kabal/languages/english/fractional_numbers'

class Kabal::English < Kabal::Language
  include Kabal::EnglishRules::NaturalNumbers
  include Kabal::EnglishRules::FractionalNumbers
end
