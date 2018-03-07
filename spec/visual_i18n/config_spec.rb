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
        config.onesky_project_id = 'Foo'
        config.repository = VisualI18n::Repositories::FooBar
      end
      expect(subject.onesky_project_id).to eq 'Foo'
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
end

module VisualI18n; module Repositories; class FooBar; end end end
