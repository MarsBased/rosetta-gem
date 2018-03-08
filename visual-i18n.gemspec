$:.push File.expand_path('../lib', __FILE__)

require 'visual_i18n/version'

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

  s.add_dependency 'onesky-rails'
  s.add_dependency 'request_store'

  s.add_dependency 'font-awesome-rails'

  # Development/Test dependencies
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'figaro'
end
