# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redirect_with_params/version'

Gem::Specification.new do |spec|
  spec.name          = "redirect_with_params"
  spec.version       = RedirectWithParams::VERSION
  spec.authors       = ["Kyle Dayton"]
  spec.email         = ["kyle@grol.ly"]
  spec.summary       = %q{Rails redirect helper for preserving query parameters}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/kyledayton/redirect_with_params"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "rails", ">= 3.2"
end
