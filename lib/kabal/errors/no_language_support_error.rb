require "kabal/errors/error"

module Kabal
  module Errors
    class NoLanguageSupportError < Error
      @code = 2
    end
  end
end
