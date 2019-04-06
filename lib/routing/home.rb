# home.rb

require_relative 'routing_base.rb'

class Home < RoutingBase

  def show
    render :show
  end
end