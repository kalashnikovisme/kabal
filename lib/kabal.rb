autoload :Version, "kabal/version"
require "kabal/supported_languages"
require 'yaml'

module Kabal
  include SupportedLanguages

  def to_text(number)
    @language ||= "Russian"
    obj = Object.const_get("Kabal::" + @language).new
    obj.convert number
  end

  def language=(language_to_set)
    languages = YAML.load_file('yaml/languages.yml')
    if languages[language_to_set]
      @language = language_to_set
    else
      raise NoLanguageSupportError.message
    end
  end

  def to_text_in_language(number, language_at_once)
    languages = YAML.load_file('yaml/languages.yml')
    if languages[language_at_once]
      obj = Object.const_get("Kabal::" + language_at_once).new
      obj.convert number
    else
      raise NoLanguageSupportError.message
    end
  end

  def current_language
    @language
  end
end
