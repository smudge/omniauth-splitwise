$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'omniauth_splitwise/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-splitwise'
  s.version  = OmniAuthSplitwise::VERSION
  s.authors  = ['Nathan Griffith']
  s.email    = ['nathan@ngriffith.com']
  s.summary  = 'Splitwise strategy for OmniAuth'
  s.homepage = 'https://github.com/smudge/omniauth-splitwise'
  s.license  = 'MIT'
  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = Dir['{lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.required_ruby_version = '>= 2.6'
  s.add_runtime_dependency 'omniauth-oauth2'
end
