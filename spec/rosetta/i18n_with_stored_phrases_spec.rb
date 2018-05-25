require 'spec_helper'

module Rosetta
  RSpec.describe I18nWithStoredPhrases do
    before do
      I18n.backend.store_translations :en, foo: { bar: 'bar' }
      allow(Rosetta).to receive(:add_phrase)
    end

    context 'enabled' do
      before do
        allow(Rosetta).to receive(:store_phrases?).and_return(true)
      end

      it 'stills return the translation' do
        expect(I18n.translate('foo.bar')).to eq 'bar'
      end

      it 'adds the phrase' do
        I18n.translate('foo.bar')

        expect(Rosetta).to have_received(:add_phrase).with(keys: %i(foo bar), phrase: 'bar')
      end

      it 'does not add the phrase if it does not exist' do
        I18n.translate('foo.non_existent')

        expect(Rosetta).to_not have_received(:add_phrase)
      end

      it 'does not add the phrase if it exists in another locale' do
        I18n.backend.store_translations :es, foo: { only_es: 'only_es' }
        I18n.translate('foo.only_es')

        expect(Rosetta).to_not have_received(:add_phrase)
      end
    end

    context 'disabled' do
      before do
        allow(Rosetta).to receive(:enabled?).and_return(false)
      end

      it 'still return the translation' do
        expect(I18n.translate('foo.bar')).to eq 'bar'
      end

      it 'does nothing if it is not enabled' do
        I18n.translate('foo.bar')

        expect(Rosetta).to_not have_received(:add_phrase)
      end
    end
  end
end
