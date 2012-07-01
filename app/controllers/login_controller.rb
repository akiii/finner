
class LoginController < ApplicationController

  include EncryptHelper

  def index
    @user = User.new
  end

  def submit
    user = User.find_by_account(params[:user]['account'])
    if user
      if match(params[:user]['password'], user.password)
        create_session(user)
	redirect_to home_index_path
      end
    else
      redirect_to login_index_path
    end
  end

end
