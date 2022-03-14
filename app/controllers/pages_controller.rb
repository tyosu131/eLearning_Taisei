class PagesController < ApplicationController

  def home
    if logged_in?
      @user = current_user
      @users = User.find(@user.followed_users.ids) # getting all of current_user's following
      @activities = Activity.where(user_id: current_user.id).or(Activity.where(user_id: @users))
                            .paginate(page: params[:id], per_page: 12)
    end
  end
  
  def about
  end
end
