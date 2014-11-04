module Kabal
  module Languages
    require 'kabal/languages/russian'
    require 'kabal/languages/english'
    require 'kabal/languages/deutsch'

    def get_name_of_language(param)
      languages = Kabal::Config::YamlLoader.yaml_object 'languages'
      if languages[param]
        param
      elsif is_abbr? param, languages
        languages.keys.select { |key| languages[key] == param.to_s }.first
      else
        NoLanguageSupportError.new
      end
    end

    def class_name_of(language)
      'Kabal::' + language.to_s
    end

    private

    def is_abbr?(param, languages_hash)
      languages_hash.values.include? param.to_s
    end
  end
end
