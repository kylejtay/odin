class ProjectsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  load_and_authorize_resource

  def index
    @projects = Project.accessible_by(current_ability)
  end

  def show
  end

  def new
  end

  def create
    @project = Project.new(project_params)
    @project.company_id = current_user.company_id
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy

    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, user_ids: [])
    end
end

