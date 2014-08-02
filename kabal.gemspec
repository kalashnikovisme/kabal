# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kabal/version'

Gem::Specification.new do |spec|
  spec.name          = "kabal"
  spec.version       = Kabal::VERSION
  spec.authors       = ["Pavel Kalashnikov"]
  spec.email         = ["kalashnikovisme@gmail.com"]
  spec.summary       = %q{Number To Text Helper}
  spec.description   = %q{Kabal allows you to translate numbers into text on languages: English, Russian, Deutsch}
  spec.homepage      = "https://github.com/kalashnikovisme/kabal"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.0.0'
  spec.metadata = { "issue_tracker" => "https://github.com/kalashnikovisme/kabal/issues" }

  spec.files         = `git ls-files`.split("\n")
  spec.post_install_message = "See documentation of Kabal on https://github.com/kalashnikovisme/kabal. Demo http://kabal.herokuapp.com"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
