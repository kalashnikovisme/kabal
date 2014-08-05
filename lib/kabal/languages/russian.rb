require 'kabal/languages/language'
require 'kabal/languages/russian/declinations'
require 'kabal/languages/russian/natural_numbers'
require 'kabal/languages/russian/fractional_numbers'

module Kabal
  class Russian < Kabal::Language
    include Kabal::RussianRules::NaturalNumbers
    include Kabal::RussianRules::FractionalNumbers
  end
end
