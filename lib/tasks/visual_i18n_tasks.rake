# desc "Explaining what the task does"
namespace :visual_i18n do
  namespace :onesky do
    desc 'Download translations from OneSky platform.'
    task upload: :environment do
      file_client.upload(locale_path)
    end

    desc 'Download translations from OneSky platform.'
    task download_all: :environment do
      file_client.download(locale_path, all: true)
    end

    def file_client
      ::VisualI18n::Repositories::Onesky::Client.new(
        'api_key' => VisualI18n.config.onesky_api_key,
        'api_secret' => VisualI18n.config.onesky_api_secret,
        'project_id' => VisualI18n.config.onesky_project_id
      )
    end

    def locale_path
      Rails.root.join('config', 'locales')
    end
  end
end
