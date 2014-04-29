class Kabal::Language
  def self.lang
    languages = YAML.load_file('yaml/languages.yml')
    @lang = languages[self.name.split(":").last]
  end

  def self.names
    YAML.load_file("yaml/languages/#{lang}.yml")
  end
end
