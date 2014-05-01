class Kabal::Language
  def lang
    languages = YAML.load_file('yaml/languages.yml')
    @lang = languages[self.to_s.split(":")[-2]]
  end

  def names
    YAML.load_file("yaml/languages/#{lang}.yml")
  end
end
