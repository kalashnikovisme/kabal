require 'active_support/core_ext/hash'
require "#{File.dirname(__FILE__)}/generator"

class RemoveLanguage < Thor::Group
  include Thor::Actions
  include Generator

  argument :language_name

  def self.source_root
    File.dirname(__FILE__)
  end

  def delete
    remove_file "#{gem_root}/lib/kabal/languages/#{language_name}.rb"
    remove_file "#{gem_root}/test/lib/kabal/languages/#{language_name}_test.rb"
    languages = YAML.load_file("#{gem_root}/yaml/languages.yml").with_indifferent_access
    language_abbr = languages[language_name.capitalize]
    remove_file "#{gem_root}/yaml/languages/#{language_abbr}.yml"
    gsub_file "#{gem_root}/yaml/languages.yml", /\n#{language_name.capitalize}: \"#{language_abbr}\"$/, ''
    gsub_file "#{gem_root}/yaml/support.yml", /\n.*#{language_abbr}.*$\n.*$\n.*$\n.*$\n.*$\n.*$/, ''
    gsub_file "#{gem_root}/lib/kabal/supported_languages.rb", /.*#{language_name}.*$\n/, ''
  end
end
