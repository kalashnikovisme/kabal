require 'kabal/errors/error'

module Kabal
  module Errors
    class NoSupportForFractionalNumberOnCurrentLanguages < Error
      @code = 3
    end
  end
end
