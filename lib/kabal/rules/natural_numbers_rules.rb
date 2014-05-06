module Kabal
  module Rules
    module NaturalNumbersRules
      def natural?(number)
        number % 1 == 0
      end

      def natural_number_name(number)
        #FIXME switch case next lines
        return single(number) if number >= 0 and number <= 19
        return two_words(number) if number >= 20 and number <= 99
        return three_words(number) if number >= 100 and number <= 999
        ten_powers(number) if number >= 1000
      end
    end
  end
end
