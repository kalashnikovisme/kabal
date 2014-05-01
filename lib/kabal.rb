autoload :Version, "kabal/version"
require "kabal/supported_languages"
require 'yaml'

module Kabal
  include SupportedLanguages

  def to_text(number)
    @language ||= "Russian"
    language_class =
    obj = Object.const_get("Kabal::" + @language).new
    obj.convert number
  end

  def language=(language_to_set)
    languages = YAML.load_file('yaml/languages.yml')
    if languages[language_to_set]
      @language = language_to_set
    end
  end

  def current_language
    @language
  end
end
