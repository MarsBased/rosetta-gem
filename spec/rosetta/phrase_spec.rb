# frozen_string_literal: true

require 'spec_helper'

module Rosetta
  RSpec.describe Phrase do
    describe '#initialize' do
      let(:phrase) { Phrase.new(%i(foo bar foobar), 'Some text', '/a/path/') }

      it '#code' do
        expect(phrase.code).to eq 'foo.bar.foobar'
      end

      it '#keys' do
        expect(phrase.keys).to eq %i(foo bar foobar)
      end

      it '#text' do
        expect(phrase.text).to eq 'Some text'
      end

      it '#repository_link' do
        expect(phrase.repository_link).to eq '/a/path/'
      end
    end
  end
end
