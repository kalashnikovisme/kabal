class Kabal::Config::YamlLoader
  def self.gem_root
    Gem::Specification.find_by_name("kabal").gem_dir
  end

  def self.yaml_object(filename)
    yaml_obj = YAML.load_file(gem_root + "/yaml/" + filename + ".yml")
  end
end
