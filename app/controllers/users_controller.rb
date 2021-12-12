class UsersController < Clearance::UsersController

  def show
    @user = User.find(params[:id])
    p @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
