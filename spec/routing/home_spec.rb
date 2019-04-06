require 'spec_helper'
require 'routing/home.rb'

describe Home do
  describe 'Home' do
    it 'response to show' do
      expect(Home.new).to respond_to(:show)
    end

    it 'returns welcome message' do
      expect(Home.new({}).show).to include("Welcome")
    end
  end
end
