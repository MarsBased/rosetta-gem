$:.push File.expand_path('lib', __dir__)

require 'rosetta/version'

Gem::Specification.new do |s|
  s.name        = 'rosetta'
  s.version     = Rosetta::VERSION
  s.authors     = ['MarsBased']
  s.email       = ['hola@marsbased.com']
  s.homepage    = 'https://github.com/MarsBased/rosetta'
  s.summary     = 'Rosetta makes it easy for copy writers to edit the translations of your app.'
  s.description = 'Rosetta makes it easy for copy writers to edit the translations of your app.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails'
  s.add_dependency 'request_store'

  # Development/Test dependencies
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-webkit'
  s.add_development_dependency 'figaro'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'database_cleaner'
end
