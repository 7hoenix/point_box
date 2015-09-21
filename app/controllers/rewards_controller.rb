class RewardsController < ApplicationController
  def show
    @reward = Reward.find(params[:id])
  end

  def index
    @rewards = Reward.all
  end

  def redeem
    @user = User.find(params[:user_id])
    @reward = Reward.find(params[:format])

    if @user.points >= @reward.cost
      cost = @reward.cost
      @user.update(points: (@user.points - cost), redeemed_points: (@user.redeemed_points + cost))
      @user.rewards << @reward

      redirect_to @user
    end

  end
end
