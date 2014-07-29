module Kabal
  module DeutschRules
    module Declinations
      def self.name_with_declination(number_name, count)
        if count != 1
          if number_name[-1, 1] == "n"
            return number_name + "en"
          elsif number_name[-1, 1] == "e"
            return number_name + "n"
          end
        end
        number_name
      end
    end
  end
end
