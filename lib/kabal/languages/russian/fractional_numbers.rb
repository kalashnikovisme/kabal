module Kabal
  module RussianRules
    module FractionalNumbers
      def fractional_number_name(number)
        whole_part_name(number) + " " + fractional_part_name(number)
      end

      def fractional_ten_powers_name(number)
        ten_powers_name = ""
        if need_pre_word? number
          ten_powers_name = fractional_pre_word(number) + fractional_order_word(number)
        else
          ten_powers_name = names[lang]["fractional_ten_powers"][fractional_number_order(number)]
        end
      end

      def fractional_order_word(number)
        names[lang]["fractional_ten_powers"][fractional_number_order(number) - (fractional_number_order(number) % 3)]
      end

      def fractional_pre_word(number)
        names[lang]["fractional_pre_words"][fractional_number_order(number) % 3]
      end

      def need_pre_word?(number)
        fractional_number_order(number) > 3 and fractional_number_order(number) % 3 != 0
      end

      def fractional_number_order(number)
        number.to_s.split('.')[1].length
      end

      def fractional_part_name(number)
        feminine_natural_number_name(fractional_order(number)) + " " + Declinations.name_with_declination(fractional_ten_powers_name(number), fractional_part)
      end

      def fractional_part(number)
        fractional_part = (number % 1).round(fractional_number_order(number))
        ((fractional_part) * (10 ** fractional_number_order(number))).to_s.split('.')[0].to_i
      end

      def whole_part_name(number)
        count = number.to_s.split('.')[0].to_i
        feminine_natural_number_name(count) + " " + Declinations.name_with_declination(whole, count)
      end
    end
  end
end
