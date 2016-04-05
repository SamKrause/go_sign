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

    def generateTestAttemptHash
      TestAttempt.all.each do |t|
        hash = {t.created_at => t.number_right}

      end
    end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :avatar)
  end
end
