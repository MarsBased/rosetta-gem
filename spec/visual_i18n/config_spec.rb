require 'spec_helper'

describe VisualI18n::Config do
  subject { described_class.new }

  before do
    ENV.delete('GEM_EDITOR')
    ENV.delete('VISUAL')
    ENV.delete('EDITOR')
  end

  describe 'Setup' do
    it do
      subject.setup do |config|
        config.repository = VisualI18n::Repositories::FooBar
        config.onesky.project_id = '123'
        config.onesky.subdomain = 'foo'
      end
      expect(subject.onesky.project_id).to eq '123'
      expect(subject.onesky.subdomain).to eq 'foo'
      expect(subject.repository).to eq(VisualI18n::Repositories::FooBar)
    end
  end

  describe 'repository' do
    it 'sets the default repository to local' do
      expect(subject.repository).to eq(VisualI18n::Repositories::Local)
    end

    it 'allows to change the repository' do
      subject.repository = VisualI18n::Repositories::FooBar

      expect(subject.repository).to eq(VisualI18n::Repositories::FooBar)
    end
  end

  describe '#set_defaults!' do
    describe 'deactive' do
      it do
        expect(subject.enabled?).to eq false
        subject.enable
        expect(subject.enabled?).to eq true

        subject.set_defaults!
        expect(subject.enabled?).to eq false
      end
    end
  end
end

module VisualI18n; module Repositories; class FooBar; end end end
