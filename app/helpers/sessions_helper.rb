module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
  end

  # def logged_in_user
  #     unless logged_in?
  #         flash[:info] = "Please login first."
  #         redirect_to login_url
  #     end
  # end

  # def current_user?(user)
  #     return true if user == current_user
  # end
end
