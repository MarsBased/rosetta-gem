require 'spec_helper'

module Rosetta
  module Repositories
    RSpec.describe Database do
      subject { described_class.new }

      it { expect(subject.label).to eq 'Database' }
      it { expect(subject.id).to eq 'database' }
    end
  end
end
