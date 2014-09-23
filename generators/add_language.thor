require "#{File.dirname(__FILE__)}/generator"

class AddLanguage < Thor::Group
  include Generator
  include Thor::Actions

  argument :language_name
  argument :language_abbr

  def self.source_root
    File.dirname(__FILE__)
  end

  def generate
    template "#{templates_path}/language.tt", "#{gem_root}/lib/kabal/languages/#{language_name}.rb"
    template "#{templates_path}/language_test.tt", "#{gem_root}/test/lib/kabal/languages/#{language_name}_test.rb"
    template "#{templates_path}/language_yaml.tt", "#{gem_root}/yaml/languages/#{language_abbr}.yml"
    append_to_file "#{gem_root}/yaml/languages.yml", "#{language_name.capitalize}: \"#{language_abbr}\""
    append_to_file "#{gem_root}/yaml/support.yml", "  #{language_abbr}:\n    natural:\n      min: {min_of_your_realization}\n      max: {max_of_your_realization}\n    fractional:\n      symbols: {count_of_symbols_after_dot_that_you_realized}"
    inject_into_file "#{gem_root}/lib/kabal/supported_languages.rb", "    require 'kabal/languages/#{language_name}'\n", before: /^  end/
  end
end
