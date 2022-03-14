class ActivitiesController < ApplicationController
  def create
    @activity = @action_type.activity.new
    @activity.user = current_user
    @activity.save
  end
end
