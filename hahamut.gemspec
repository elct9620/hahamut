# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hahamut/version'

Gem::Specification.new do |spec|
  spec.name          = 'hahamut'
  spec.version       = Hahamut::VERSION
  spec.authors       = ['蒼時弦也']
  spec.email         = ['concat@frost.tw']

  spec.summary       = 'The Hahamut client'
  spec.description   = 'This is the client for messaging app ' \
                       'Hahamut build by gamer.com.tw'
  spec.homepage      = 'https://github.com/elct9620/hahamut'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that
  # have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`
      .split("\x0")
      .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rack'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'bundler-audit'
  spec.add_development_dependency 'overcommit'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.73.0'
  spec.add_development_dependency 'simplecov'
end
