autoload :Version, "kabal/version"
require "kabal/supported_languages"
require 'yaml'

module Kabal
  include SupportedLanguages

  def to_text(number)

    Russian.convert number
  end
end
