class RewardsController < ApplicationController
  def show
    @reward = Reward.find(params[:id])
  end

  def index
    @rewards = Reward.all
  end
end
