class UsersController < ApplicationController
  layout 'dashboard'
  load_and_authorize_resource

  def index
    @users = User.accessible_by(current_ability)
  end

  def show
  end

  def new
    @dashboard_permission = nil
    @forecasting_permission = nil
    @projects_permission = nil
    @team_permission = nil
  end

  def create
    @user = User.new(resource_params)
    @user.company_id = current_user.company_id
    @user.permissions = [{"team"=>"0", "projects"=>"0", "dashboard"=>"0", "forecasting"=>"0"}]
    if @user.invite!(current_user)
      redirect_to company_users_path
    else
      render new_company_user_path
    end
  end

  def edit
    @dashboard_permission = @user['permissions'][0]['dashboard']
    @forecasting_permission =  @user['permissions'][0]['forecasting']
    @projects_permission =  @user['permissions'][0]['projects']
    @team_permission =  @user['permissions'][0]['team']
  end

  def update
    if @user.update(resource_params)
      redirect_to company_users_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def resource_params
      params.require(:user).permit(:first_name, :last_name, :email, :admin, permissions: [:dashboard, :forecasting, :projects, :team])
    end
end

