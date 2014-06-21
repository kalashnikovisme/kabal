module Kabal
  module Errors
    class NoLanguageSupportError < StandardError
      def self.message
        "There is no support of such language yet"
      end
    end
  end
end
