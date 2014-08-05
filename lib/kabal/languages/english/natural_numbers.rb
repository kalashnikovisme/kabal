module Kabal
  module EnglishRules
    module NaturalNumbers
      def single(number)
        names[:single][number]
      end

      def two_words(number)
        return single number if number <= 19
        number_name = names[:two_words][number / 10]
        number_name += " " + single(number % 10) if (number % 10 != 0)
        number_name
      end

      def three_words(number)
        return two_words number if number <= 99
        number_name = single(number / 100) + " " + names[:ten_powers][2]
        number_name += " " + two_words(number % 100) if number % 100 >= 10
        number_name += " " + names[:and] + " " + single(number % 100) if number % 100 < 10 and number % 100 != 0
        number_name
      end

      def ten_powers(number)
        less_thousands number if number_is_thousands? number
        return @number_name if number_is_thousands? number
        create_number_name number
        ten_powers number % (10 ** number_order(number))
      end

      def count_name_with_order_name(number)
        three_words(count(number)) + " " + names[:ten_powers][number_order(number)]
      end

      def less_thousands(number)
        return if number == 0
        @number_name += " " + names[:and] if number < 100
        @number_name += " " + three_words(number % 1000) unless number == 0
      end
    end
  end
end
