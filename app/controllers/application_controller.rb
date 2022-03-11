class ApplicationController < ActionController::Base
  include SessionsHelper
  include LessonsHelper

  def only_admin
    if admin_user?
      # flash[:success] = "You are admin user."
    else
      flash[:danger] = "You are not authorized."
      redirect_to root_url
    end
  end
end
