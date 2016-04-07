class UsersController < ApplicationController
  def signup
    @user = User.create(user_params)
    sign_in(:user, @user)

    if @user.valid?
      view_string = render_to_string partial: 'home/welcome'
      render json: {success: true, welcome: view_string}
    else
      render json: {success: false, errors: @user.errors.full_messages}
    end
  end

  def index
    @test_attempt_hash_family = generateTestAttemptHash(current_user.id, getCategoryId("Family"))
    @test_attempt_hash_food = generateTestAttemptHash(current_user.id, getCategoryId("Food"))
    @test_attempt_hash_feelings = generateTestAttemptHash(current_user.id, getCategoryId("Feelings"))
    @chart_hash_family = generateChartGraphHash(current_user.id, "Family")
    @chart_hash_feelings = generateChartGraphHash(current_user.id, "Feelings")
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :avatar)
  end
end
