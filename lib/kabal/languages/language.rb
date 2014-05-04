module Kabal
  class Language
    def lang
      languages = YamlLoader.yaml_object "languages"
      @lang = languages[self.to_s.split(":")[-2]]
    end

    def supports_natural?
      supports = YamlLoader.yaml_object "support"
      supports["support"][lang]["natural"]
    end

    #TODO реализовать метод supports_negative?

    def supports_fractional?
      supports = YamlLoader.yaml_object "support"
      supports["support"][lang]["fractional"]
    end

    def names
      YamlLoader.yaml_object "languages/#{lang}"
    end

    def minus
      YamlLoader.yaml_object("languages/#{lang}")[lang]["minus"]
    end

    def whole
      YamlLoader.yaml_object("languages/#{lang}")[lang]["whole"]
    end

    def natural?(number)
      number % 1 == 0
    end

    def fractional?(number)
      number % 1 != 0
    end
  end
end
