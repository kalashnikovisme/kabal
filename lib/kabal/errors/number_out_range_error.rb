module Kabal
  module Errors
    class NumberOutRangeError < StandardError
      def self.message
        "Number is out of the range for current language"
      end
    end
  end
end
