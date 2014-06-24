autoload :Version, "kabal/version"
require "kabal/supported_languages"
require "kabal/errors"
require "kabal/config"
require 'yaml'

module Kabal
  include SupportedLanguages
  include Errors
  include Config

  def to_text(number)
    obj = Object.const_get("Kabal::" + current_language).new
    obj.convert number
  end

  def language=(language_to_set)
    languages = Kabal::Config::YamlLoader.yaml_object "languages"
    if languages[language_to_set]
      @language = language_to_set
    else
      raise NoLanguageSupportError.message
    end
  end

  def to_text_in_language(number, language_at_once)
    languages = Kabal::Config::YamlLoader.yaml_object "languages"
    if languages[language_at_once]
      obj = Object.const_get("Kabal::" + language_at_once).new
      obj.convert number
    else
      raise NoLanguageSupportError.message
    end
  end

  def to_text_in_language_by_index(number, language_at_once_index)
    languages = Kabal::Config::YamlLoader.yaml_object("languages").to_a
    if languages[language_at_once_index]
      obj = Object.const_get("Kabal::" + languages[language_at_once_index].first).new
      obj.convert number
    else
      raise NoLanguageSupportError.message
    end
  end

  def current_language
    @language ||= "Russian"
    @language
  end

  def supported_languages
    languages = Kabal::Config::YamlLoader.yaml_object "languages"
    languages.keys
  end

  def current_language_supports_natural?
    obj = Object.const_get("Kabal::" + current_language).new
    obj.supports_natural?
  end

  def current_language_supports_fractional?
    obj = Object.const_get("Kabal::" + current_language).new
    obj.supports_fractional?
  end
end
