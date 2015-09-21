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

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find_by(params[:name])

    @reward.update(reward_params)

    redirect_to @reward
  end


    private

    def reward_params
      params.require(:reward).permit(:name, :cost)
    end
end
