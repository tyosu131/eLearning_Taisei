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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Proofile Update"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      flash[:danger] = "You are not authorized."
      redirect_to root_url
    end
  end

  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end
  
end
