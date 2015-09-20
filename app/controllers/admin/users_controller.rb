class Admin::UsersController < AdminController
  def add_points
    @user = User.find_by(username: params[:user][:username])
    @user.points += params[:user][:points].to_i
    @user.save
    redirect_to @user
  end
end
