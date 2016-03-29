class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end
  helper_method :current_user

  def authorize_user
    if current_user.nil?
      redirect_to root_path, notice: 'Не залогинен'
    end
  end
end