$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'visual_i18n/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'visual-i18n'
  s.version     = VisualI18n::VERSION
  s.authors     = ['MarsBased']
  s.email       = ['hola@marsbased.com']
  s.homepage    = 'https://github.com/MarsBased/visual-i18n'
  s.summary     = 'Summary of VisualI18n.'
  s.description = 'Description of VisualI18n.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.1.4'
  s.add_development_dependency 'sqlite3'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails'
end
