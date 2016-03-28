class AnswersController < ApplicationController
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
  def answer_params
    params.require(:answer).permit(:answer, :gif, :admin_id)
  end

end
