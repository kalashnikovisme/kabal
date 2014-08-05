module Kabal
  module GlobalRules
    module FractionalNumbers

      def fractional_part_order(number)
        number_string = number.to_s
        if number_string.include? "-"
          number_string.split('-')[1].to_i
        else
          number_string.split('.')[1].length
        end
      end

      def fractional_part_name(number)
        @count_string = fractional_part_string(number).to_s.split('.')[1]
        @count_int = @count_string.to_i
        if is_there_zeros_before_fractional_part?
          number_name_with_zeros + natural_number_name(@count_int)
        else
          natural_number_name @count_int
        end
      end

      def is_there_zeros_before_fractional_part?
        @count_string.size != @count_int.to_s.size
      end

      def zeros_number
        @count_string.size - @count_int.to_s.size
      end

      def number_name_with_zeros
        name = ""
        zeros_number.times do
          name += names["single"][0] + " "
        end
        name
      end
    end
  end
end
