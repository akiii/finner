
class ProjectsController < ApplicationController
  before_filter :session_exist

  def index
    @user = current_user
    @projects = @user.projects
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
    Participant.create(:project_id => project.id, :user_id => current_user.id, :authority => true, :is_allowed => true)

    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
    if current_user.can_edit(@project)
#      @notAllowedUsers = 
    else
      redirect_to projects_path
    end
  end

  def update
    project = Project.find(params[:id])
    if current_user.can_edit(project)
      project.name = params[:project][:name]
      project.description = params[:project][:description]
      if params[:open] == "open"
        project.open = true
      else
        project.open = false
      end
      if params[:release] == "release"
        project.released = true
      else
        project.released = false
      end
      project.save
      redirect_to projects_path
    else
      redirect_to projects_path
    end
  end

end
