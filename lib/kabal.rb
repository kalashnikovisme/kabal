autoload :Version, "kabal/version"
require "kabal/supported_languages"
require 'yaml'

module Kabal
  include SupportedLanguages

  def to_text(number)
    rus = Russian.new
    rus.convert number
  end
end
