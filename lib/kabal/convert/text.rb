module Kabal
  module Convert
    module Text
      def self.text_to_number_in_language(text, language)
        language_name = get_name_of_language language
        obj = Object.const_get(Kabal::Convert::Number.class_name_of(language)).new
        if obj.supports_reverse?
          obj.reverse_convert text
        else
          LanguageDoesNotSupportReverse.new
        end
      end
    end
  end
end
