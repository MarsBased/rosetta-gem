require 'spec_helper'

module VisualI18n
  module Repositories
    RSpec.describe Onesky do
      subject { described_class.new }

      before(:each) do
        VisualI18n.config.onesky.project_id = '123'
        VisualI18n.config.onesky.subdomain = 'foo'
      end

      it { expect(described_class.label).to eq 'Onesky' }
      it { expect(described_class.id).to eq 'onesky' }

      describe '.build_link' do
        subject { described_class.method(:build_link) }

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
        subject { described_class.new.method(:phrase_url) }

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
