module Kabal
  class Language
    def lang
      languages = YamlLoader.yaml_object "languages"
      @lang = languages[self.to_s.split(":")[-2]]
    end

    def names
      YamlLoader.yaml_object "languages/#{lang}"
    end

    def minus
      YamlLoader.yaml_object("languages/#{lang}")[lang]["minus"]
    end
  end
end
