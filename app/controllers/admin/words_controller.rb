class Admin::WordsController < ApplicationController
  before_action :only_admin

  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Success!"
        redirect_to admin_category_path(@category)
    else
      flash[:danger] = "This form contains errors."
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    if @word.update(word_params)
      flash[:success] = "Updated"
      redirect_to admin_category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = @category.words.find(params[:id])
    @word.destroy
    redirect_to admin_category_path(@category)
  end

  private
  def word_params
    params.require(:word).permit(:word)
  end
end
