class Kabal::Language
  def self.abbreviation
    languages = YAML.load_file('yaml/languages.yml')
    @abbreviation = languages[self.name.split(":").last]
  end
end
