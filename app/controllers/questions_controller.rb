class QuestionsController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def question_params
    params.require(:question).permit(:category_id)
  end
end
