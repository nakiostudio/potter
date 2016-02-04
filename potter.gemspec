# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "potter/version"

Gem::Specification.new do |spec|
  spec.name          = "potter"
  spec.version       = Potter::VERSION
  spec.authors       = ["Carlos Vidal"]
  spec.email         = ["nakioparkour@gmail.com"]
  spec.summary       = Potter::DESCRIPTION
  spec.description   = Potter::DESCRIPTION
  spec.homepage      = "https://github.com/nakiostudio/potter"
  spec.license       = "MIT"

  spec.required_ruby_version = ">= 2.0.0"

  spec.files = Dir["lib/**/*"] + %w(bin/potter README.md LICENSE)

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'terminal-table' # print out build information

  # Development only
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop", "~> 0.35.1"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "yard", "~> 0.8.7.4"
  spec.add_development_dependency "webmock", "~> 1.19.0"
  spec.add_development_dependency "coveralls"
end
