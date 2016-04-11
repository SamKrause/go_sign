class AttemptsController < ApplicationController
  def show
  end

  def new
  end

  def create
    Attempt.create(attempt_params)
    # @t_attempt = TestAttempt.find(session[:test_attempt_id]).atempts.push
    # @possible_questions = ALL - @t_attempt.attempts
    # @next_question =
    # respond_to do |format|
    #   format.js
    # end
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
