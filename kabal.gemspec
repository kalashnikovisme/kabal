# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kabal/version'

Gem::Specification.new do |spec|
  spec.name          = "kabal"
  spec.version       = Kabal::VERSION
  spec.authors       = ["pavel"]
  spec.email         = ["kalashnikovisme@gmail.com"]
  spec.summary       = %q{Number To Text Helper}
  spec.description   = %q{Kabal allows you to translate numbers into text.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
