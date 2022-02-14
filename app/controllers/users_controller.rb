class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Saved"
      redirect_to root_url
   else
    render 'new'
   end
  end

  # def show
  #   @user = User.find(params[:id])
  #   @microposts = @user.microposts.paginate(page: params[:page], per_page: 12)
  #   @micropost = current_user.microposts.build if logged_in?
  # end

  # private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
