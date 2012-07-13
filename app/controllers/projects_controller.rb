
class ProjectsController < ApplicationController
  before_filter :session_exist

  layout "project"

  def index
    @user = current_user
    @projects = @user.projects
    @user.friends.each do |f|
      f.projects.each do |p|
        unless @projects.index(p)
          @projects << p
	end
      end
    end
    @projects.flatten!
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

  def send_participate_request
    Participant.create(:project_id => params[:id], :user_id => current_user.id, :authority => false, :is_allowed => false)
    redirect_to projects_path
  end

  def approve_request
    p = Participant.find_by_project_id_and_user_id(params[:id], params[:user_id])
    p.is_allowed = true
    p.save
    redirect_to projects_path
  end

  def give_approve_to_user
    p = Participant.find_by_project_id_and_user_id(params[:id], params[:user_id])
    p.authority = true
    p.save
    redirect_to edit_project_path, :id => params[:id]
  end

end
