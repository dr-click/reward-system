# routes.rb

require_relative '../routing/home.rb'
require_relative '../routing/rewards.rb'

# HomeController
get '/' do
  Home.new(params).show
end

# RewardsController
post '/rewards' do
  Rewards.new(params).create
end
