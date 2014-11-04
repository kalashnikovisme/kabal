module Kabal
  module Convert
    module Number
      def self.number_to_text_in_language(number, language)
        number = string_convert number
        language = get_name_of_language language
        convert_in_language number, language
      end

      def self.number_to_text_in_language_by_index(number, index)
        number = string_convert number
        language = get_name_of_language_by_index index
        convert_in_language number, language
      end

      private

      def self.string_is_float?(number)
        number.include? '.'
      end

      def self.string_convert(number)
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
    end
  end
end
