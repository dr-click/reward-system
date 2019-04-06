require 'spec_helper'
require 'reward_system/calculation.rb'

describe RewardSystem::Calculation do
  describe 'Calculation' do
    context 'model' do
      let(:calculation) { RewardSystem::Calculation.new(nil) }

      [:data_file, :data_list, :recommends_tree, :recommend_scores].each do |attr|
        it "respond to #{attr}" do
          expect(calculation).to respond_to(attr)

        end
      end
    end

    context 'object' do
      let(:data_file_1) { "spec/fixtures/sample_1.rb" }
      let(:calculation) { RewardSystem::Calculation.new(data_file_1) }

      it "returns scores" do
        expect(calculation.execute).to eq({
          "A" => 1.75,
          "B" => 1.5,
          "C" => 1.0
        }.inspect)
      end
    end

    context 'object' do
      let(:data_file_2) { "spec/fixtures/sample_2.rb" }
      let(:calculation) { RewardSystem::Calculation.new(data_file_2) }

      it "returns scores" do
        expect(calculation.execute).to eq({
          "A" => 2.875,
          "B" => 1.75,
          "D" => 3.0,
          "C" => 1.5
        }.inspect)
      end
    end

  end
end
