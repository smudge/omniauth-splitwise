# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/splitwise/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-splitwise'
  s.version  = OmniAuth::Splitwise::VERSION
  s.authors  = ['Nathan Griffith']
  s.email    = ['nathan@ngriffith.com']
  s.summary  = 'Splitwise strategy for OmniAuth'
  s.homepage = 'https://github.com/Smudge/omniauth-splitwise'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0.0'
  s.add_runtime_dependency 'multi_json'
end
