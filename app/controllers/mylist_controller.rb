
class MylistController < ApplicationController
  before_filter :session_exist

  layout "mylist"

  def index
    @current_user = current_user
    @friends = @current_user.friends
  end

end
