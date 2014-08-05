module Kabal
  module GlobalRules
    module NaturalNumbers
      def natural_number_name(number)
        return single number if number >= 0 and number <= 19
        return two_words number if number >= 0 and number <= 99
        return three_words number if number >= 100 and number <= 999
        ten_powers number if number >= 100
      end
    end
  end
end
