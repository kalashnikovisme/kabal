module Kabal
  module DeutschRules
    module FractionalNumbers
      def fractional_number_name(number)
        whole_part_name(number) + " " + dot + " " + fractional_part_name(number)
      end

      def whole_part_name(number)
        count = number.floor
        natural_number_name(count)
      end

      def fractional_part_string(number)
        "%.#{fractional_part_order(number)}f" % number
      end
    end
  end
end
