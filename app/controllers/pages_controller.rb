class PagesController < ApplicationController

  def home
    if logged_in?
      # @feed_items = current_user.feed.paginate(page: params[:id], per_page: 12)
      @user = current_user
    end
  end
  
  def about
  end
end
