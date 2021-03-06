module Kabal
  module RussianRules
    module FractionalNumbers
      def fractional_number_name(number)
        join_with_spaces whole_part_name(number), fractional_part_name(number)
      end

      def fractional_part_name(number)
        fractional_part = (number % 1).round(fractional_part_order(number))
        fractional_order = ((fractional_part) * (10**fractional_part_order(number))).to_s.split('.')[0].to_i
        join_with_spaces feminine_natural_number_name(fractional_order, true), Declinations.name_with_declination(fractional_ten_powers_name(number), fractional_part)
      end

      def whole_part_name(number)
        count = number.floor
        join_with_spaces feminine_natural_number_name(count), Declinations.name_with_declination(whole, count)
      end

      def fractional_ten_powers_name(number)
        if need_pre_word? number
          fractional_pre_word(number) + fractional_order_word(number)
        else
          names[:fractional_ten_powers][fractional_part_order(number)]
        end
      end

      def fractional_order_word(number)
        names[:fractional_ten_powers][fractional_part_order(number) - (fractional_part_order(number) % 3)]
      end

      def fractional_pre_word(number)
        names[:fractional_pre_words][fractional_part_order(number) % 3]
      end

      def need_pre_word?(number)
        fractional_part_order(number) > 3 && fractional_part_order(number) % 3 != 0
      end
    end
  end
end
