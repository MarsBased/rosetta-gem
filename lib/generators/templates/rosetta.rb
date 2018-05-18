# Use this hook to configure the repository and other Rosetta options.
Rosetta.setup do |config|
  # Uncomment the following lines to use the OneSky repository.
  # config.repository = Rosetta::Repositories::Onesky.new
  # config.repository.project_id = ENV['ONESKY_PROJECT_ID']
  # config.repository.subdomain = ENV['ONESKY_SUBDOMAIN']

  # Uncomment the following lines to use the Local repository.
  # config.repository = Rosetta::Repositories::Local.new
end
