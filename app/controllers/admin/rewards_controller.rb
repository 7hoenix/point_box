class Admin::RewardsController < AdminController
  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)

    if @reward.save
      flash[:notice] = "Reward created"
      redirect_to @reward
    else
      flash[:errors] = "Reward not created"
      render :new
    end
  end

    private

    def reward_params
      params.require(:reward).permit(:name, :cost)
    end
end
