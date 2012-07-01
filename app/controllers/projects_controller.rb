
class ProjectsController < ApplicationController
  before_filter :session_exist

  def index
    @user = current_user
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(params[:project])
    if params[:open] == "open"
      project.open = true
    else
      project.open = false
    end
    project.released = false
    project.save
    Participant.create(:project_id => project.id, :user_id => current_user.id, :authority => true, :isAllowed => true)

    redirect_to projects_path
  end

  def edit

  end

end
