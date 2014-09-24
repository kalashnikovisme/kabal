autoload :Version, 'kabal/version'
require 'kabal/supported_languages'
require 'kabal/errors'
require 'kabal/config'
require 'yaml'

module Kabal
  include SupportedLanguages
  include Config
  include Errors

  def to_text(number)
    to_text_in_language number, current_language
  end

  def language=(language_to_set)
    languages = Kabal::Config::YamlLoader.yaml_object 'languages'
    if languages[language_to_set]
      @language = language_to_set
    else
      fail NoLanguageSupportError.message
    end
  end

  def to_text_in_language(number, language_at_once)
    number = string_convert number
    languages = Kabal::Config::YamlLoader.yaml_object 'languages'
    if languages[language_at_once]
      convert_in_language number, language_at_once
    elsif languages.values.include? language_at_once.to_s
      need_language = languages.keys.select { |key| languages[key] == language_at_once.to_s }.first
      convert_in_language number, need_language
    else
      NoLanguageSupportError.message
    end
  end

  def to_text_in_language_by_index(number, language_at_once_index)
    number = string_convert number
    languages = Kabal::Config::YamlLoader.yaml_object('languages').to_a
    if languages[language_at_once_index]
      obj = Object.const_get(language_class_name(languages[language_at_once_index].first)).new
      obj.convert number
    else
      NoLanguageSupportError.message
    end
  end

  def current_language
    @language ||= 'English'
    @language
  end

  def self.supported_languages
    languages = Kabal::Config::YamlLoader.yaml_object 'languages'
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

  #Define languages methods
  supported_languages.each do |language|
    define_method "to_text_in_#{language.downcase}" do |number|
      to_text_in_language number, language
    end
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
    number.include? '.'
  end

  def language_class_name(language)
    'Kabal::' + language.to_s
  end

  def convert_in_language(number, language)
    if number > maximum_for(language) || number < minimum_for(language)
      NumberOutRangeError.message
    else
      obj = Object.const_get(language_class_name(language)).new
      obj.convert number
    end
  end
end
