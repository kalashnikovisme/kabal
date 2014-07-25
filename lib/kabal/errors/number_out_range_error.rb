require "kabal/errors/error"

module Kabal
  module Errors
    class NumberOutRangeError < Error
      @code = 1
    end
  end
end
