autoload :Version, "kabal/version"
require "kabal/supported_languages"
require "kabal/errors"
require "kabal/config"
require 'yaml'

module Kabal
  include SupportedLanguages
  include Config
  include Errors

  def to_text(number)
    to_text_in_language number, current_language
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
    number = string_convert number
    languages = Kabal::Config::YamlLoader.yaml_object "languages"
    if languages[language_at_once]
      if number > maximum_for(language_at_once) or number < minimum_for(language_at_once)
        NumberOutRangeError.message
      else
        obj = Object.const_get(language_class_name(language_at_once)).new
        obj.convert number
      end
    else
      NoLanguageSupportError.message
    end
  end

  def to_text_in_language_by_index(number, language_at_once_index)
    number = string_convert number
    languages = Kabal::Config::YamlLoader.yaml_object("languages").to_a
    if languages[language_at_once_index]
      obj = Object.const_get(language_class_name(languages[language_at_once_index].first)).new
      obj.convert number
    else
      NoLanguageSupportError.message
    end
  end

  def current_language
    @language ||= "English"
    @language
  end

  def supported_languages
    languages = Kabal::Config::YamlLoader.yaml_object "languages"
    languages.keys
  end

  def current_language_supports_natural?
    obj = Object.const_get(language_class_name(current_language)).new
    obj.supports_natural?
  end

  def current_language_supports_fractional?
    obj = Object.const_get(language_class_name(current_language)).new
    obj.supports_fractional?
  end

  def language_supports_negative?(language)
    obj = Object.const_get(language_class_name(language)).new
    obj.supports_negative?
  end

  def language_supports_fractional?(language)
    obj = Object.const_get(language_class_name(language)).new
    obj.supports_fractional?
  end

  def maximum_for(language)
    obj = Object.const_get(language_class_name(language)).new
    obj.max_value
  end

  def minimum_for(language)
    obj = Object.const_get(language_class_name(language)).new
    obj.min_value
  end

  private

  def string_convert(number)
    if number.is_a? String
      if string_is_float? number
        Kernel::Float(number)
      else
        number.to_i
      end
    else
      number
    end
  end

  def string_is_float?(number)
    number.include? "."
  end

  def language_class_name(language)
    "Kabal::" + language
  end
end
