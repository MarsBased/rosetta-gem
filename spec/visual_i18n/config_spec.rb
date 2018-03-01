require 'spec_helper'

describe VisualI18n::Config do
  subject { described_class.new }

  before do
    ENV.delete('GEM_EDITOR')
    ENV.delete('VISUAL')
    ENV.delete('EDITOR')
  end

  describe 'editor' do
    context 'without local settings' do
      before { allow(subject).to receive(:local_settings).and_return({}) }

      it 'sets the default editor to /usr/local/bin/subl' do
        expect(subject.editor).to eq('/usr/local/bin/subl')
      end

      it 'uses $GEM_EDITOR over $VISUAL and $EDITOR' do
        ENV['GEM_EDITOR'] = 'vim'
        ENV['VISUAL'] = 'emacs'
        ENV['EDITOR'] = 'emacs'

        expect(subject.editor).to eq('vim')
      end

      it 'uses $VISUAL over $EDITOR' do
        ENV['GEM_EDITOR'] = nil
        ENV['VISUAL'] = 'vim'
        ENV['EDITOR'] = 'emacs'

        expect(subject.editor).to eq('vim')
      end
    end

    context 'with local settings' do
      before { allow(subject).to receive(:config_file).and_return(file_fixture('.visual-i18n-config')) }

      it 'uses the value from local settings' do
        ENV['GEM_EDITOR'] = 'vim'

        expect(subject.editor).to eq('emacs')
      end
    end
  end

  describe 'Setup' do
    it do
      VisualI18n.setup do |config|
        config.onesky_project_id = 'Foo'
        config.repository = VisualI18n::Repositories::FooBar
      end
      expect(VisualI18n.config.onesky_project_id).to eq 'Foo'
      expect(VisualI18n.config.repository).to eq(VisualI18n::Repositories::FooBar)
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
