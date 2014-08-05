module Kabal
  module GlobalRules
    module NaturalNumbers
      def natural_number_name(number)
        return single number if number >= 0 and number <= 19
        return two_words number if number >= 0 and number <= 99
        return three_words number if number >= 100 and number <= 999
        ten_powers number if number >= 100
      end

      def create_number_name(number)
        if @number_name.nil?
          @number_name = count_name_with_order_name number
        elsif count(number) != 0
          @number_name += " " + count_name_with_order_name(number)
        end
      end
    end
  end
end
