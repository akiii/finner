
class ProfileController < ApplicationController
  before_filter :session_exist

  include EncryptHelper

  def index
    @current_user = current_user
    @user = User.find_by_account(params[:account])
    if !@user
      @user = current_user
    end
  end

  def edit_base
    @user = current_user
    @universities = University.all
    @udrs = UniversityDepartmentRelationship.all
  end

  def update_base
    user = current_user
    user.account = params[:user][:account]
    user.university_department_relationship_id = params[:user][:university_department_relationship_id]
    user.profile = params[:user][:profile]
    if params[:user][:icon]
      user.icon = nil
      user.icon = params[:user][:icon]
    end
    if user.save
      redirect_to profile_index_path
    else
      redirect_to profile_me_edit_base_path
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    if params[:user][:new_password] == params[:user][:new_password_confirm]
      user = current_user
      if match(params[:user][:current_password], user.password)
        user.password = encrypt(params[:user][:new_password])
        user.save
	redirect_to profile_index_path
      else
        redirect_to profile_me_edit_password_path
      end
    else
      redirect_to profile_me_edit_password_path
      redirect_to :action => 'edit_password'
    end
  end

end
