module Kabal
  module Convert
    module Number
      def self.number_to_text_in_language(number, language)
        number = string_convert number
        language = get_name_of_language language
        convert_in_language number, language
      end
    end
  end
end
