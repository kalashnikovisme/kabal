module Kabal
  module Errors
    class NoSupportForFractionalNumberOnCurrentLanguages < StandardError
      def self.message
        "Current language doesn't support fractional numbers"
      end
    end
  end
end
