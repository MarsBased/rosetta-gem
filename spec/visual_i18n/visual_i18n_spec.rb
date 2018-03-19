require 'spec_helper'

RSpec.describe VisualI18n do
  describe '#add_phrase' do
    it 'adds the phrase when correct arguments' do
      # TODO: described_class.add_phrase(keys: %i(foo bar), text: 'Hello World!')
      VisualI18n.add_phrase(keys: %i(foo bar), text: 'Hello World!')

      phrase = VisualI18n.phrases.first
      expect(phrase.code).to eq 'foo.bar'
      expect(phrase.text).to eq 'Hello World!'
    end

    it 'requires a keys argument' do
      expect do
        VisualI18n.add_phrase(text: 'Hello World!')
      end.to raise_error(ArgumentError)
    end

    it 'requires a text argument' do
      expect do
        VisualI18n.add_phrase(keys: %i(foo bar))
      end.to raise_error(ArgumentError)
    end
  end

  describe '#store_phrases?' do
    it 'stores phrases when the collection is initialized' do
      RequestStore.store[:used_phrases] = []

      expect(VisualI18n.store_phrases?).to be_truthy
    end

    pending 'does not store phrases when the collection is not initialized' do
      RequestStore.store[:used_phrases] = nil

      expect(VisualI18n.store_phrases?).to be_falsey
    end
  end

  describe 'public_interface' do
    it { expect(described_class).to respond_to(:config) }
    it { expect(described_class).to respond_to(:setup) }
    it { expect(described_class).to respond_to(:locale) }
  end
end
