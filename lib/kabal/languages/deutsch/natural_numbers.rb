module Kabal
  module DeutschRules
    module NaturalNumbers
      def single(number)
        unless @ein
          names["single"][number]
        else
          @ein = false
          names["single"][number].chop
        end
      end

      def two_words(number)
        return single number if number <= 19
        number_name = names["two_words"][number / 10]
        @ein = (number % 10 == 1)
        number_name = single(number % 10) + names["and"] + number_name if (number % 10 != 0)
        number_name
      end

      def three_words(number)
        return two_words number if number <= 99
        @ein = (number / 100 == 1)
        number_name = single(number / 100) + names["ten_powers"][2]
        number_name += two_words(number % 100) if (number % 100 >= 10)
        number_name += single(number % 100) if number % 100 < 10 and number % 100 != 0
        number_name
      end

      def ten_powers(number)
        less_thousands number if number_is_thousands? number
        return @number_name if number_is_thousands? number
        create_number_name number
        ten_powers number % (10 ** number_order(number))
      end

      def create_number_name(number)
        if @number_name.nil?
          @number_name = words_to_add(number)
        elsif count(number) != 0
          @number_name += words_to_add(number)
        end
      end

      def count_name(number)
        three_words count(number)
      end

      def less_thousands(number)
        return if number == 0
        @number_name += three_words(number % 1000) unless number == 0
      end

      def millions_or_greater?(number)
        number_order(number) > 3
      end

      def words_to_add(number)
        if millions_or_greater?(number)
          number_with_space number
        else
          number_without_space number
        end
      end

      def number_with_space(number)
        @number_name = count_name(number) + " " + Declinations.name_with_declination(names["ten_powers"][number_order(number)], count(number)) + " "
      end

      def number_without_space(number)
        @number_name = count_name(number) + Declinations.name_with_declination(names["ten_powers"][number_order(number)], count(number))
      end
    end
  end
end
