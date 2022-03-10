class LessonsController < ApplicationController

  def new
    @user_id = current_user.id
    @category_id = Category.find(params[:category_id])
    @lesson = Lesson.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = @category.lessons.build(user: current_user)
    if @lesson.save!
      flash[:success] = "Success"
      redirect_to new_category_lesson_answer_path(category_id: @category.id, lesson_id: @lesson.id)
    else
      render 'new'
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @answers = @lesson.answers 
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id)
  end
end
