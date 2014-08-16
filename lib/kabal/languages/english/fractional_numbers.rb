module Kabal
  module EnglishRules
    module FractionalNumbers
      def fractional_number_name(number)
        if whole_part_name(number) != ''

          join_with_spaces whole_part_name(number), dot, fractional_part_name(number)
        else
          join_with_spaces dot, fractional_part_name(number)
        end
      end

      def whole_part_name(number)
        count = number.floor
        count != 0 ? natural_number_name(count) : ''
      end

      def fractional_part_string(number)
        "%.#{fractional_part_order(number)}f" % number
      end
    end
  end
end
