autoload :Version, 'kabal/version'
require 'kabal/languages'
require 'kabal/errors'
require 'kabal/config'
require 'kabal/convert'
require 'yaml'

module Kabal
  include Languages
  include Config
  include Errors
  include Convert

  #Number to text
  def to_text(number)
    Kabal::Convert::Number.number_to_text_in_language number, current_language
  end

  def to_text_in_language(number, language_at_once)
    Kabal::Convert::Number.number_to_text_in_language number, language_at_once
  end

  def to_text_in_language_by_index(number, language_at_once_index)
    Kabal::Convert::Number.number_to_text_in_language_by_index number, language_at_once_index
  end

  #Text to number
  def to_number(text)
    Kabal::Convert::Text.text_to_number_in_language text, current_language
  end

  #Languages methods
  def language=(language_to_set)
    languages = Kabal::Config::YamlLoader.yaml_object 'languages'
    if languages[language_to_set]
      @language = language_to_set
    else
      fail "fail"
    end
  end

  def current_language
    @language ||= 'English'
    @language
  end

  def self.supported_languages
    Kabal::Languages.supported_languages
  end

  def current_language_supports_natural?
    obj = Object.const_get(Kabal::Convert::Number.class_name_of(current_language)).new
    obj.supports_natural?
  end

  def current_language_supports_fractional?
    obj = Object.const_get(Kabal::Convert::Number.class_name_of(current_language)).new
    obj.supports_fractional?
  end

  def language_supports_negative?(language)
    obj = Object.const_get(Kabal::Convert::Number.class_name_of(language)).new
    obj.supports_negative?
  end

  def language_supports_fractional?(language)
    obj = Object.const_get(Kabal::Convert::Number.class_name_of(language)).new
    obj.supports_fractional?
  end

  def maximum_for(language)
    if language.is_a? StandardError
      language
    else
      obj = Object.const_get(Kabal::Convert::Number.class_name_of(language)).new
      obj.max_value
    end
  end

  def minimum_for(language)
    obj = Object.const_get(Kabal::Convert::Number.class_name_of(language)).new
    obj.min_value
  end

  #Define languages methods
  supported_languages.each do |language|
    define_method "to_text_in_#{language.downcase}" do |number|
      to_text_in_language number, language
    end
  end

  private

  def convert_in_language(number, language)
    if language.is_a? StandardError
      language
    else
      if number > maximum_for(language) || number < minimum_for(language)
        NumberOutRangeError.new
      else
        if language.is_a? StandardError
          language
        else
          obj = Object.const_get(Kabal::Convert::Number.class_name_of(language)).new
          obj.convert number
        end
      end
    end
  end
end
