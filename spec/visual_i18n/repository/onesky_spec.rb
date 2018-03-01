require 'spec_helper'

module VisualI18n
  module Repositories
    RSpec.describe Onesky do
      subject { described_class.new }

      before(:each) do
        stub_const('VisualI18n::Repositories::Onesky::BASE_URL', 'http://lol.lol')
        described_class.any_instance.stub(:project_id).and_return('111')
      end

      describe '#phrase_url' do
        it { expect(subject.phrase_url(%w[foo bar])).to eq 'http://lol.lol/111/language/1#/?keyword=foo.bar' }
        it { expect(subject.phrase_url(%w[foo bar], code: 'BAD!!')).to eq 'http://lol.lol/111/language/1#/?keyword=foo.bar' }
        it { expect(subject.phrase_url(%w[foo bar], code: 'es-ES')).to eq 'http://lol.lol/111/language/568#/?keyword=foo.bar' }
      end

      describe '#build_link' do
        it { expect(Onesky.build_link(%w[foo bar])).to eq 'http://lol.lol/111/language/1#/?keyword=foo.bar' }
        it { expect(Onesky.build_link(%w[foo bar], code: 'BAD!!')).to eq 'http://lol.lol/111/language/1#/?keyword=foo.bar' }
        it { expect(Onesky.build_link(%w[foo bar], code: 'es-ES')).to eq 'http://lol.lol/111/language/568#/?keyword=foo.bar' }
      end
    end
  end
end
