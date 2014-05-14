module Kabal
  class Language
    def initialize
      @names = YamlLoader.yaml_object "languages/#{lang}"
      @supports = YamlLoader.yaml_object("support")["support"][lang]
    end

    def convert(number)
      check_supports_for number
      convert_number number
    end

    def lang
      languages = YamlLoader.yaml_object "languages"
      @lang = languages[self.to_s.split(":")[-2]]
    end

    def supports_natural?
      @supports["natural"]
    end

    #TODO реализовать метод supports_negative?

    def min_value
      eval @supports["natural"]["min"]
    end

    def max_value
      eval @supports["natural"]["max"]
    end

    def supports_fractional?
      @supports["fractional"]
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

    def check_supports_for(number)
      if number % 1 != 0 and not supports_fractional?
        raise NoSupportForFractionalNumberOnCurrentLanguages.message
      end
      if number >= max_value or number <= min_value
        raise NumberOutRangeError.message
      end
    end
  end
end
