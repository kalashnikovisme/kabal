module Kabal
  module Errors
    class Error < StandardError
      @message = "There is some error"
      @code = "Unknown error code"

      def self.message
        errors = YamlLoader.yaml_object "errors"
        errors["errors"]["messages"][@code]
      end
    end
  end
end
