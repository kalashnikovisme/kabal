autoload :Version, "kabal/version"
require "kabal/supported_languages"
require 'yaml'

module Kabal
  include SupportedLanguages

  def to_text(number)
    names = YAML.load_file('yaml/languages/ru.yml')
    names[Russian.abbreviation]["single"][number]
  end
end
