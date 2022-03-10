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
    else
      result = 0 # temporary container for total score
      @lesson.answers.each do |answer| # looping thru all the answers user picked
        if answer.choice.is_answer? # checking is user's choice is the correct one
          result += 1 # result = result + 1
        end
        @lesson.update_attributes(:result => result) # updating result column
      end
      redirect_to category_lesson_path(@category, @lesson)
    end  
  end

  private
  def answer_params
    params.permit(:lesson_id, :word_id, :choice_id)
  end
end
