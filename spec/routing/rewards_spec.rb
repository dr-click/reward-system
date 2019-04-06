require 'spec_helper'
require 'routing/rewards.rb'

describe Rewards do
  describe 'Rewards' do
    let(:tempfile){ File.join('spec', 'fixtures', 'sample_1.rb') }

    it 'response to create' do
      expect(Rewards.new).to respond_to(:create)
    end

    it 'returns empty scores if no params' do
      expect(Rewards.new.create).to eq({})
    end
  end
end
