
module VisualI18n
  module Repositories
    class Onesky

      class Client < ::Onesky::Rails::FileClient

        def download(string_path, _options = {})
          all_available_locales.each do |locale|
            puts "Downloading #{locale}..."
            file_list.each do |file|
              response = @project.export_translation(source_file_name: file,
                                                     locale: locale)
              next if response.blank?
              save_translation(response, string_path, [locale.to_s, file].join('/'))
              puts " - #{file} done!"
            end
          end
        end

        private

        def all_available_locales
          [:en] + I18n.available_locales.reject { |locale| locale == :en }
        end

        def file_list
          JSON.parse(@project.list_file)['data'].map { |e| e['file_name'] }
        end

        def save_translation(response, string_path, target_file)
          file_path = File.join(string_path, target_file)
          File.open(file_path, 'w') do |f|
            f.write(TRANSLATION_NOTICE + response.body.force_encoding(ENCODING))
          end
        end

      end

    end
  end
end
