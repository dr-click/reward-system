require_relative '../routing/home.rb'
require_relative '../routing/home.rb'

# HomeController
get '/' do
  Home.new(params).show
end