# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liste/version'

Gem::Specification.new do |gem|
  gem.name          = "liste"
  gem.version       = Liste::VERSION
  gem.authors       = ["Daniel Ethridge"]
  gem.email         = ["danielethridge@icloud.com"]
  gem.license = 'GPL-3.0'

  gem.summary       = %q{Liste - Helpful reminders in the comfort of your terminal}
  gem.homepage      = "https://github.com/wlib/liste"

  gem.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  gem.bindir        = "bin"
  gem.executables   = ["liste"]
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.13"
  gem.add_development_dependency "rake", "~> 10.0"
end