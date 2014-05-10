module Kabal
  class Language
    def initialize
      @names = YamlLoader.yaml_object "languages/#{lang}"
      @supports = YamlLoader.yaml_object("support")["support"][lang]
    end

    def lang
      languages = YamlLoader.yaml_object "languages"
      @lang = languages[self.to_s.split(":")[-2]]
    end

    def supports_natural?
      @supports["natural"]
    end

    #TODO реализовать метод supports_negative?

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

    def natural_number_name(number)
      #FIXME switch case next lines
      return single(number) if number >= 0 and number <= 19
      return two_words(number) if number >= 20 and number <= 99
      return three_words(number) if number >= 100 and number <= 999
      ten_powers(number) if number >= 1000
    end
    def natural?(number)
      number % 1 == 0
    end
  end
end
