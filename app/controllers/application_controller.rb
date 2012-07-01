class ApplicationController < ActionController::Base
  protect_from_forgery

  def session_exist
    unless session[:user_id]
      redirect_to root_path
    end
  end

  def current_user
    return User.find(session[:user_id])
  end

  def create_session(user)
    destroy_session
    session[:user_id] = user.id
  end

  def destroy_session
    reset_session
  end

end
