class AddLanguage < Thor::Group
  include Thor::Actions

  argument :language_name
  argument :language_abbr

  def self.source_root
    File.dirname(__FILE__)
  end

  def generate
    template 'templates/language.tt', "lib/kabal/languages/#{language_name}.rb"
    template 'templates/language_test.tt', "test/lib/kabal/languages/#{language_name}_test.rb"
    template 'templates/language_yaml.tt', "yaml/languages/#{language_abbr}.yml"
    append_to_file 'yaml/languages.yml', "#{language_name.capitalize}: \"#{language_abbr}\""
    append_to_file 'yaml/support.yml', "  #{language_abbr}:\n    natural:\n      min: {min_of_your_realization}\n      max: {max_of_your_realization}\n    fractional:\n      symbols: {count_of_symbols_after_dot_that_you_realized}"
    inject_into_file 'lib/kabal/supported_languages.rb', "    require 'kabal/languages/#{language_name}'\n", before: /^  end/
  end
end
