module Kabal
  module GlobalRules
    module FractionalNumbers

      def fractional_part_order(number)
        #FIXME find better way with whole 0 numbers
        number_string = number.to_s
        if number_string.include? "-"
          number_string.split('-')[1].to_i
        else
          number_string.split('.')[1].length
        end
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
    end
  end
end
