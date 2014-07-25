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
        count = number.to_s.split('.')[0].to_i
        count != 0 ? natural_number_name(count) : ""
      end

      def fractional_part_name(number)
        name = ""
        count_string = number.to_s.split('.')[1]
        count = count_string.to_i
        if count_string.size != count.to_s.size
          (count.to_s.size..count_string.size - 1).each do
            name += names["single"][0] + " "
          end
          name + natural_number_name(count)
        else
          natural_number_name(count)
        end
      end
    end
  end
end
