require 'kabal/languages/global/fractional_numbers'

module Kabal
  class Language
    include Kabal::GlobalRules::FractionalNumbers

    def initialize
      @names = Kabal::Config::YamlLoader.yaml_object "languages/#{lang}"
      @supports = Kabal::Config::YamlLoader.yaml_object("support")["support"][lang]
    end

    def convert(number)
      if no_supports? number
        error number
      else
        convert_number number
      end
    end

    def convert_number(number)
      @number_name = nil
      if need_minus? number
        minus + " " + number_words(-number)
      else
        number_words number
      end
    end

    def number_words(number)
      return natural_number_name number.round if natural? number
      fractional_number_name number if fractional? number
    end

    def error(number)
      if number_is_out_of_the_range? number
        return Kabal::Errors::NumberOutRangeError.message
      end
      if not supports_fractional? and number % 1 != 0
        Kabal::Errors::NoSupportForFractionalNumberOnCurrentLanguages.message
      end
    end

    def lang
      languages = Kabal::Config::YamlLoader.yaml_object "languages"
      @lang = languages[self.to_s.split(":")[-2]]
    end

    def supports_natural?
      @supports["natural"]
    end

    def supports_negative?
      min_value < 0
    end

    def min_value
      eval @supports["natural"]["min"]
    end

    def max_value
      eval @supports["natural"]["max"]
    end

    def names
      @names[lang]
    end

    def minus
      names["minus"]
    end

    def whole
      names["whole"]
    end

    def dot
      names["dot"]
    end

    def fractional?(number)
      number % 1 != 0
    end

    def natural?(number)
      number % 1 == 0
    end

    def number_is_thousands?(number)
      number_order(number) < 3
    end

    def number_is_google?(number)
      count(number) == 10 and number_order(number) == 99
    end

    def number_order(number)
      ((number.to_s.length - 1) / 3) * 3
    end

    def count(number)
      number / (10 ** number_order(number))
    end

    def supports_fractional?
      @supports["fractional"]
    end

    def number_is_out_of_the_range?(number)
      number >= max_value or number <= min_value
    end

    def no_supports?(number)
      (number % 1 != 0 and not supports_fractional?) or number_is_out_of_the_range?(number)
    end

    def need_minus?(number)
      number < 0
    end
  end
end
