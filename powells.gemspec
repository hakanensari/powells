# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'powells/version'

Gem::Specification.new do |gem|
  gem.name        = 'powells'
  gem.version     = Powells::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ['Hakan Ensari']
  gem.email       = ['me@hakanensari.com']
  gem.homepage    = 'https://github.com/hakanensari/powells'
  gem.summary     = 'Powells.com API wrapper'
  gem.license     = 'MIT'

  gem.files         = Dir.glob('lib/**/*') + %w(LICENSE README.md)
  gem.test_files    = Dir.glob('test/**/*')
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'excon'
  gem.add_development_dependency 'minitest', '~> 5.0'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'vcr'

  gem.required_ruby_version = '>= 2.0'
end
