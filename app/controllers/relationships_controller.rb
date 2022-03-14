class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    @relationship = current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    @relationship.create_activity(user: current_user)
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
