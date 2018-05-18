require 'spec_helper'

module Rosetta
  module Repositories
    RSpec.describe Onesky do
      let(:repository) {
        obj = described_class.new
        obj.project_id = '123'
        obj.subdomain = 'foo'
        obj
      }

      it { expect(subject.label).to eq 'Onesky' }
      it { expect(subject.id).to eq 'onesky' }

      describe '.build_link' do
        subject { repository.method(:build_link) }

        its([%w[foo bar]]) do
          is_expected.to eq 'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/1#/?keyword=foo.bar'
        end
        its([%w[foo bar], locale: 'BAD!!']) do
          is_expected.to eq 'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/1#/?keyword=foo.bar'
        end
        its([%w[foo bar], locale: 'es-ES']) do
          is_expected.to eq 'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/568#/?keyword=foo.bar'
        end
      end

      describe '#phrase_url' do
        subject { repository.method(:phrase_url) }

        its([%w[foo bar]]) do
          is_expected.to eq 'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/1#/?keyword=foo.bar'
        end
        its([%w[foo bar], locale: 'BAD!!']) do
          is_expected.to eq 'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/1#/?keyword=foo.bar'
        end
        its([%w[foo bar], locale: 'es-ES']) do
          is_expected.to eq 'https://foo.oneskyapp.com/collaboration/translate/project/project/123/language/568#/?keyword=foo.bar'
        end
      end
    end
  end
end
