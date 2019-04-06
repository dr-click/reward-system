require 'spec_helper'
require 'reward_system/tree.rb'

describe RewardSystem::Tree do
  describe 'Tree' do
    context 'model' do
      let(:tree) { RewardSystem::Tree.new("name") }

      [:name, :children, :find, :find_parents].each do |attr|
        it "respond to #{attr}" do
          expect(tree).to respond_to(attr)

        end
      end
    end

    context 'object' do
      let(:tree_1) { RewardSystem::Tree.new("tree_1") }
      let(:tree_2) { RewardSystem::Tree.new("tree_2") }
      let(:tree_3) { RewardSystem::Tree.new("tree_3") }

      before do
        tree_2.children << tree_3
        tree_1.children << tree_2
      end

      it "returns tree when find" do
        expect(tree_1.find("tree_1")).to eq(tree_1)
        expect(tree_2.find("tree_2")).to eq(tree_2)
        expect(tree_3.find("tree_3")).to eq(tree_3)
      end

      it "returns parents when find_parents" do
        expect(tree_1.find_parents("tree_1")).to eq([])
        expect(tree_1.find_parents("tree_2")).to eq(["tree_1"])
        expect(tree_1.find_parents("tree_3")).to eq(["tree_1", "tree_2"])
      end
    end
  end
end
