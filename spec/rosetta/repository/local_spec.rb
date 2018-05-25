require 'spec_helper'

module Rosetta
  module Repositories
    RSpec.describe Local do
      subject { described_class.new }

      it { expect(subject.label).to eq 'Repository Local' }
      it { expect(subject.id).to eq 'local' }

      describe '.build_link' do
        context 'with an invalid file' do
          before(:each) do
            I18n.load_path << file_fixture('invalid.yml')
          end

          it 'raises an exception' do
            expect do
              subject.build_link(%w[not_found])
            end.to raise_error(I18n::InvalidLocaleData)
          end
        end

        it 'returns the file where the translation is stored' do
          expect(subject.build_link(%w[common text]).to_s).to eq 'config/locales/en/common.yml'
        end
      end
    end
  end
end
