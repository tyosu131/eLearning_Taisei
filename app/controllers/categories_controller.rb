class CategoriesController < ApplicationController
  #filter: only logged in user can access thispage
  before_action :only_loggedin_users, only: [:index]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
    @lesson = Lesson.new
    @lessons = Lesson.all
  end

  private
  def only_loggedin_users
    redirect_to login_url unless logged_in?
  end
end
