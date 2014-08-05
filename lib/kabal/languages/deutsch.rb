require 'kabal/languages/language'
require 'kabal/languages/deutsch/natural_numbers'
require 'kabal/languages/deutsch/declinations'
require 'kabal/languages/deutsch/fractional_numbers'

class Kabal::Deutsch < Kabal::Language
  include Kabal::DeutschRules::NaturalNumbers
  include Kabal::DeutschRules::FractionalNumbers
end
