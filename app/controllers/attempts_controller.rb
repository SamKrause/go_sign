class AttemptsController < ApplicationController
  def show
  end

  def new
  end

  def create
    Attempt.create(attempt_params)
  end

  def update
  end

  def destroy
  end

  private
  def attempt_params
    params.permit(:user_id, :question_id, :correct)
  end

end
