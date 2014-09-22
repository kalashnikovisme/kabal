class RemoveLanguage < Thor::Group
  include Thor::Actions

  argument :language_name

  def self.source_root
    File.dirname(__FILE__)
  end

  def delete
    remove_file "lib/kabal/languages/#{language_name}.rb"
    remove_file "test/lib/kabal/languages/#{language_name}_test.rb"
    #remove_file "yaml/languages/#{language_abbr}.yml"
  end
end
