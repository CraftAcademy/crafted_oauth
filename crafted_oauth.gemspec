# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-crafted/version'

Gem::Specification.new do |gem|
  gem.name          = "crafted-oauth"
  gem.version       = Omniauth::Spotify::VERSION
  gem.authors       = ["Craft Academy"]
  gem.email         = ["academy@craftacademy.se\n"]
  gem.description   = %q{OmniAuth strategy for CraftAcademy LMS Crafted}
  gem.summary       = %q{OmniAuth strategy for CraftAcademy LMS Crafted}
  gem.homepage      = "https://github.com/craftacademylabs/crafted_oauth"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
end
