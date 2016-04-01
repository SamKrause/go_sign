class TestAttemptsController < ApplicationController
  def show
  end

  def new
  end

  def create
    TestAttempt.create(attempt_params)
  end

  def update
  end

  def destroy
  end

  private
  def attempt_params
    params.permit(:user_id, :category_id, :number_right, :number_wrong)
  end

end
