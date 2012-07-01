
class SignupController < ApplicationController

  include EncryptHelper

  def index
    @user = User.new
    @universities = University.all
    @udrs = UniversityDepartmentRelationship.all
  end

  def submit
    if params[:user]['password'] == params[:password_confirm]
      user = User.new(params[:user])
      user.password = encrypt(params[:user]['password'])

      if user.save
        redirect_to :controller => 'login', :action => 'index'
      else
        redirect_to :action => 'index'
      end
    else
      redirect_to :action => 'index'
    end
  end

end
