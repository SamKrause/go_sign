class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def generateTestAttemptHash(id, category_id)
    test_attempt_hash = {}
    number = 1
    User.find(id).test_attempts.where(:category_id => category_id).limit(20).each do |t|
      test_attempt_hash.merge!("Test: "+number.to_s => t.number_right)
      number = number + 1
    end
    return test_attempt_hash
  end

  def generateChartGraphHash(id, category)
    chart_graph_hash = {}
    Category.find_by_name(category).questions.each do |question|
      chart_graph_hash.merge!(question.name.capitalize => question.attempts.where(:user_id => id).where(:correct => false).count)
    end
    return chart_graph_hash
  end

  def getCategoryId(name)
    return Category.find_by_name(name).id
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :avatar) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :first_name, :last_name, :password, :current_password, :password_confirmation, :avatar) }
  end
end
