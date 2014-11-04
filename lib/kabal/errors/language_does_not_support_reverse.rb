require 'kabal/errors/error'

module Kabal
  module Errors
    class LanguageDoesNotSupportReverse < Error
      @code = 4
    end
  end
end
