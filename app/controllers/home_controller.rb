
class HomeController < ApplicationController
  before_filter :session_exist

  layout "home"

  def index
    @current_user = current_user
    @reccomend_users = []
    users = User.all
    users.each do |u|
      unless u == @current_user || @current_user.friends.index(u)
        @reccomend_users << u
      end
    end
  end

  def logout
    destroy_session
    redirect_to root_path
  end

end
