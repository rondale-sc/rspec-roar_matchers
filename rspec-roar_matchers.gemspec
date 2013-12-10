# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roar_matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-roar_matchers"
  spec.version       = Rspec::RoarMatchers::VERSION
  spec.authors       = ["Hashrocket Workstation"]
  spec.email         = ["dev@hashrocket.com"]
  spec.description   = %q{Rspec::RoarMatchers is a collection of matchers designed to enforce a contract between your spec and representer.}
  spec.summary       = %q{ Rspec::RoarMatchers is a collection of matchers designed to enforce a contract between your spec and representer.  The driving concern, while recently developing for an app that was making extensive use of Roar, was the fact that we were able to modify the various representers without the spec complaining. }

  spec.homepage      = "https://github.com/rondale-sc/rspec-roar_matchers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "roar", "~> 0.12.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
