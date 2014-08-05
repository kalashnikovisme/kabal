module Kabal
  module RussianRules
    module NaturalNumbers
      def feminine_natural_number_name(number, fractional_part = false)
        @number = number
        @feminine_name = !fractional_part
        @fractional_part = fractional_part
        natural_number_name number
      end

      def single(number, this_is_end = true)
        if @feminine_name
          @feminine_name = false
          return names["single_feminine"][count(number) % 10] if count(number) % 10 == 1 or count(number) % 10 == 2
        end
        if @fractional_part and this_is_end
          @fractional_part = false
          return names["single_feminine"][count(number) % 10] if count(number) % 10 == 1 or count(number) % 10 == 2
        end
        names["single"][number]
      end

      def two_words(number, this_is_end = true)
        return single(number, this_is_end) if number <= 19
        number_name = names["two_words"][number / 10]
        number_name += " " + single(number % 10, this_is_end) if (number % 10 != 0)
        number_name
      end

      def three_words(number, this_is_end = true)
        return two_words(number, this_is_end) if number / 100 == 0
        number_name = names["three_words"][number / 100]
        return number_name += " " + two_words(number % 100, this_is_end) if (number % 100 >= 20)
        return number_name += " " + single(number % 100, this_is_end) if (number % 100 != 0)
        number_name
      end

      def ten_powers(number)
        return names["ten_powers"][100] if number_is_google? number
        less_thousands number if number_is_thousands? number
        return @number_name if number_is_thousands? number
        create_number_name number
        ten_powers(number % (10 ** number_order(number)))
      end

      def create_number_name(number)
        if @number_name.nil?
          @number_name = count_name(number) + " " + Declinations.name_with_declination(names["ten_powers"][number_order(number)], count(number))
        elsif count(number) != 0
          @number_name += " " + count_name(number) + " " + Declinations.name_with_declination(names["ten_powers"][number_order(number)], count(number))
        end
      end

      def less_thousands(number)
        @number_name += " " + three_words(number % 1000) unless number == 0
      end

      def count_name(number)
        if (number.to_s[-4] == "1" or number.to_s[-4] == "2") and count(number) and (count(number) % 100) / 10 != 1 and number_order(number) == 3
          @feminine_name = true
        else
          @feminine_name = false
        end
        three_words count(number), false
      end
    end
  end
end
