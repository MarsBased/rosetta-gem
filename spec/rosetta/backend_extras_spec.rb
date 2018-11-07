# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Rosetta::BackendExtras::Simple do
  describe '.translates_list' do
    it do
      expect(described_class.new(backend: I18n::Backend::Simple.new).translates_list['samples.index.hello']).to eq 'Hello world!!'
    end
  end
end

RSpec.describe Rosetta::BackendExtras::ActiveRecord do
  describe '.translates_list' do
    it do
      I18n::Backend::ActiveRecord::Translation.create(locale: 'en', key: 'samples.goodbye', value: 'Goodbye!!')
      expect(described_class.new(backend: I18n::Backend::ActiveRecord.new).translates_list['samples.goodbye']).to eq 'Goodbye!!'
    end
  end
end

RSpec.describe Rosetta::BackendExtras::Chain do
  describe '.translates_list' do
    it do
      I18n::Backend::ActiveRecord::Translation.create(locale: 'en', key: 'samples.goodbye', value: 'Goodbye!!')
      I18n::Backend::ActiveRecord::Translation.create(locale: 'en', key: 'samples.index.hello', value: 'Hi!!')
      backend = I18n::Backend::Chain.new(I18n::Backend::ActiveRecord.new, I18n::Backend::Simple.new)

      expect(described_class.new(backend: backend).translates_list['samples.index.hello']).to eq 'Hi!!'
      expect(described_class.new(backend: backend).translates_list['samples.goodbye']).to eq 'Goodbye!!'
    end
  end
end
