# rewards.rb

require_relative 'routing_base.rb'
require_relative '../reward_system/calculation.rb'

class Rewards < RoutingBase

  def create
    RewardSystem::Calculation.new(tempfile).execute
  end

  #######
  private
  #######

  def params_file
    @_params_file ||= params[:file]
  end

  def tempfile
    params_file[:tempfile] if params_file
  end
end