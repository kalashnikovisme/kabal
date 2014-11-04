require 'kabal/config'

module Kabal
  module Errors
    class Error < StandardError
      @message = 'There is some error'
      @code = 'Unknown error code'

      def message
        errors = Kabal::Config::YamlLoader.yaml_object 'errors'
        errors[:errors][:messages][@code]
      end

      def code
        @code
      end
    end
  end
end
