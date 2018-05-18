require 'spec_helper'

RSpec.describe VisualI18n do
  it '.setup' do
    described_class.config.repository = VisualI18n::Repositories::Local

    described_class.setup { |config| config.repository = VisualI18n::Repositories::Onesky }

    expect(described_class.config.repository).to eq VisualI18n::Repositories::Onesky
  end

  it '.repository' do
    described_class.config.repository = VisualI18n::Repositories::Onesky

    expect(described_class.repository).to eq VisualI18n::Repositories::Onesky
  end

  it 'can be configured' do
    described_class.config.repository = VisualI18n::Repositories::Onesky

    expect(described_class.config.repository).to eq VisualI18n::Repositories::Onesky
  end

  describe '.add_phrase' do
    it 'adds the phrase when correct arguments' do
      allow(VisualI18n::Repositories::Local).to receive(:build_link).and_return 'en.hello.world'

      described_class.add_phrase(keys: %i(foo bar), phrase: 'Hello World!')

      phrase = VisualI18n.phrases.first
      expect(phrase.code).to eq 'foo.bar'
      expect(phrase.text).to eq 'Hello World!'
      expect(phrase.repository_link).to eq 'en.hello.world'
    end

    it 'requires a keys argument' do
      expect do
        described_class.add_phrase(phrase: 'Hello World!')
      end.to raise_error(ArgumentError)
    end

    it 'requires a text argument' do
      expect do
        described_class.add_phrase(keys: %i(foo bar))
      end.to raise_error(ArgumentError)
    end
  end

  describe '.enabled?' do
    it '.enable' do
      described_class.enable
      expect(described_class.enabled?).to eq true
    end

    it '.disable' do
      described_class.disable
      expect(described_class.enabled?).to eq false
    end
  end
end
