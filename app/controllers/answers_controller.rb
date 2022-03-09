class AnswersController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 1)
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
  end

  def create
    @category = Category.find(params[:category_id])
    @lesson = Lesson.find(params[:lesson_id])
    @choice = Choice.find(params[:choice_id])
    @answer = @lesson.answers.build(answer_params)
    @answer.save
    unless params[:page].nil?
      redirect_to new_category_lesson_answer_path(@category, @lesson, page: params[:page])
    end  
  end

  private
  def answer_params
    params.require(:answer).permit(:lesson_id, :word_id, :choice_id)
  end
end
