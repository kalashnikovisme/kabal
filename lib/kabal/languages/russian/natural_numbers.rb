module Kabal
  module RussianRules
    module NaturalNumbers
      def feminine_natural_number_name(number, fractional_part = false)
        @number_name = nil
        @number = number
        @feminine_name = !fractional_part
        @fractional_part = fractional_part
        natural_number_name number
      end

      def single(number, this_is_end = true)
        if @feminine_name
          @feminine_name = false
          return names[:single_feminine][count(number) % 10] if count_can_be_feminine? number
        end
        if @fractional_part && this_is_end
          @fractional_part = false
          return names[:single_feminine][count(number) % 10] if count_can_be_feminine? number
        end
        names[:single][number]
      end

      def two_words(number, this_is_end = true)
        return single(number, this_is_end) if number <= 19
        number_name = names[:two_words][number / 10]
        number_name += space + single(number % 10, this_is_end) if (number % 10 != 0)
        number_name
      end

      def three_words(number, this_is_end = true)
        return two_words(number, this_is_end) if number / 100 == 0
        number_name = names[:three_words][number / 100]
        return number_name += space + two_words(number % 100, this_is_end) if (number % 100 >= 20)
        return number_name += space + single(number % 100, this_is_end) if (number % 100 != 0)
        number_name
      end

      def ten_powers(number)
        return names[:ten_powers][100] if number_is_google? number
        less_thousands number if number_is_thousands? number
        return @number_name if number_is_thousands? number
        create_number_name number
        ten_powers(number % (10 ** number_order(number)))
      end

      def count_can_be_feminine?(number)
        count(number) % 10 == 1 || count(number) % 10 == 2
      end

      def less_thousands(number)
        @number_name += space + three_words(number % 1000) unless number == 0
      end

      def count_name(number)
        if (number.to_s[-4] == '1' || number.to_s[-4] == '2') && count(number) && (count(number) % 100) / 10 != 1 && number_order(number) == 3
          @feminine_name = true
        else
          @feminine_name = false
        end
        three_words count(number), false
      end

      def count_name_with_order_name(number)
        join_with_spaces count_name(number), Declinations.name_with_declination(names[:ten_powers][number_order(number)], count(number))
      end
    end
  end
end
