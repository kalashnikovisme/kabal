autoload :Version, "kabal/version"
require 'yaml'

module Kabal
  def to_text(number)
    YAML.load_file('names/ru.yml')
  end
end
