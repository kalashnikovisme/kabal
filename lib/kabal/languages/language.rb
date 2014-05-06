module Kabal
  class Language
    def initialize
      @names = YamlLoader.yaml_object "languages/#{lang}"
      @supports = YamlLoader.yaml_object "support"
    end

    def lang
      languages = YamlLoader.yaml_object "languages"
      @lang = languages[self.to_s.split(":")[-2]]
    end

    def supports_natural?
      @supports["support"][lang]["natural"]
    end

    #TODO реализовать метод supports_negative?

    def supports_fractional?
      @supports["support"][lang]["fractional"]
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
  end
end
