class SessionsController < ApplicationController
  def new
  end

  # def create
  #   user = User.find_by(email: params[:session][:email])
  #   if user && user.authenticate(params[:session][:password])
  #     log_in(user)
  #     flash[:saccess] = "Successfully logged in"
  #     redirect_to root_url
  #  else
  #     flash[:danger] = "Invaild Credentials"
  #     redirect_to login_url
  #  end 
  # end

  # def destroy
  #   log_out
  #   flash[:succes] = "Successfully logged out"
  #   redirect_to root_url
  # end
end
