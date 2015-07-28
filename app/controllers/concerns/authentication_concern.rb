module AuthenticationConcern

  extend ActiveSupport::Concern

  # run these commands when the file is included by something, like ApplicationController that includes AuthenticationConcern
  included do
    helper_method :current_user
    helper_method :logged_in?
  end

  def login_user(user)
    session[:user_id] = user.id
  end

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.clear
  end

end

