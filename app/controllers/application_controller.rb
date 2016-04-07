class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def generateTestAttemptHash(current_user_id, category_id)
    test_attempt_hash = {}
    number = 1
    User.find(current_user_id).test_attempts.where(:category_id => category_id).limit(20).each do |t|
      test_attempt_hash.merge!("Test: "+number.to_s => t.number_right)
      number = number + 1
    end
    return test_attempt_hash
  end

  def generateAttemptHash(current_user_id, category)
    correct_answer_hash = {}
    incorrect_answer_hash ={}
    Category.find_by_name(category).questions.each do |question|
      incorrect_answer_hash.merge!(question.name.capitalize => question.attempts.where(:user_id => current_user_id).where(:correct => false).count)
    end
    Category.find_by_name(category).questions.each do |question|
      correct_answer_hash.merge!(question.name.capitalize => question.attempts.where(:user_id => current_user_id).where(:correct => true).count)
    end
    attempt_array = [{name: "Correct", data: correct_answer_hash}, {name: "Incorrect", data: incorrect_answer_hash}]
    return attempt_array
  end

  def getCategoryId(name)
    return Category.find_by_name(name).id
  end

  def generateLineChartArray(current_user_id)
    line_chart_array = []
    family_hash = generateTestAttemptHash(current_user_id, getCategoryId("Family"))
    feelings_hash = generateTestAttemptHash(current_user_id, getCategoryId("Feelings"))
    food_hash = generateTestAttemptHash(current_user_id, getCategoryId("Food"))
    line_chart_array.push({name: "Family", data: family_hash}) if family_hash
    line_chart_array.push({name: "Feelings", data: feelings_hash}) if feelings_hash
    line_chart_array.push({name: "Food", data: food_hash}) if food_hash
    return line_chart_array
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :first_name, :last_name, :password, :current_password, :password_confirmation, :avatar) }
  end
end
