module Kabal
  module EnglishRules
    module FractionalNumbers
      def fractional_number_name(number)
        if whole_part_name(number) != ""
          whole_part_name(number) + " " + dot + " " + fractional_part_name(number)
        else
          dot + " " + fractional_part_name(number)
        end
      end

      def whole_part_name(number)
        count = number.floor
        count != 0 ? natural_number_name(count) : ""
      end

      def fractional_part_name(number)
        name = ""
        count_string = fractional_part_string(number).to_s.split('.')[1]
        count = count_string.to_i
        if count_string.size != count.to_s.size
          (count_string.size - count.to_s.size).times do
            name += names["single"][0] + " "
          end
          name + natural_number_name(count)
        else
          natural_number_name(count)
        end
      end

      def fractional_part_string(number)
        "%.#{fractional_part_order(number)}f" % number
      end

      def fractional_part_order(number)
        #FIXME find better way with whole 0 numbers
        number_string = number.to_s
        if number_string.include? "-"
          number_string.split('-')[1].to_i
        else
          number_string.split('.')[1].length
        end
      end
    end
  end
end
