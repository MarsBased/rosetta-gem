# frozen_string_literal: true

require 'spec_helper'

describe Rosetta::Config do
  subject { described_class.new }

  describe 'Setup' do
    it do
      subject.setup do |config|
        config.repository = Rosetta::Repositories::FooBar.new
      end
      expect(subject.repository.class).to eq Rosetta::Repositories::FooBar
    end
  end

  describe 'repository' do
    it 'sets the default repository to local' do
      expect(subject.repository.class).to eq Rosetta::Repositories::Local
    end

    it 'allows to change the repository' do
      subject.repository = Rosetta::Repositories::FooBar.new

      expect(subject.repository.class).to eq Rosetta::Repositories::FooBar
    end
  end
end

module Rosetta; module Repositories; class FooBar; end end end
