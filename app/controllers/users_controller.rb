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
    @column_chart_family = generateAttemptHash(current_user.id, "Family")
    @column_chart_feelings = generateAttemptHash(current_user.id, "Feelings")
    @column_chart_food = generateAttemptHash(current_user.id, "Food")
    @line_chart_array = generateLineChartArray(current_user.id)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :avatar)
  end
end
