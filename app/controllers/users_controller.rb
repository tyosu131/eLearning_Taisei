class UsersController < ApplicationController
  # def new
  #   @user = User.new(name: params[:name], email: params[:email])
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully Saved"
      redirect_to root_url
   else
    render 'new'
   end
  end

end
