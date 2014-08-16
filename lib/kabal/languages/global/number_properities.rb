module Kabal
  module GlobalRules
    module NumberProperities
      def fractional?(number)
        number % 1 != 0
      end
      def natural?(number)
        number % 1 == 0
      end
      def number_is_thousands?(number)
        number_order(number) < 3
      end
      def number_is_google?(number)
        count(number) == 10 && number_order(number) == 99
      end
      def need_minus?(number)
        number < 0
      end
    end
  end
end
