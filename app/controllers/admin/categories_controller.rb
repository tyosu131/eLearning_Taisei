class Admin::CategoriesController < ApplicationController
  before_action :only_admin

  def new
    @user = User.new
  end

  def create
    
  end

  def show
  end

  def index
    @users = User.all.order("created_at DESC")
  end

  private
  # def if_not_admin
  #   redirect_to root_path unless current_user.admin?
  # end
end
