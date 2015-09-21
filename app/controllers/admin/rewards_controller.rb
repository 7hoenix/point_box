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

    if @reward.update(reward_params)
      redirect_to @reward
    else
      render file: "/public/404" unless current_admin?
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.delete

    redirect_to rewards_path
  end


    private

    def reward_params
      params.require(:reward).permit(:name, :cost)
    end
end
