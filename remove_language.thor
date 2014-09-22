require 'active_support/core_ext/hash'

class RemoveLanguage < Thor::Group
  include Thor::Actions

  argument :language_name

  def self.source_root
    File.dirname(__FILE__)
  end

  def delete
    remove_file "lib/kabal/languages/#{language_name}.rb"
    remove_file "test/lib/kabal/languages/#{language_name}_test.rb"
    languages = YAML.load_file("#{File.dirname(__FILE__)}/yaml/languages.yml").with_indifferent_access
    language_abbr = languages[language_name.capitalize]
    remove_file "yaml/languages/#{language_abbr}.yml"
    gsub_file 'yaml/languages.yml', /\n#{language_name.capitalize}: \"#{language_abbr}\"$/, ''
    gsub_file 'yaml/support.yml', /\n.*#{language_abbr}.*$\n.*$\n.*$\n.*$\n.*$\n.*$/, ''
    gsub_file 'lib/kabal/supported_languages.rb', /.*#{language_name}.*$\n/, ''
  end
end
