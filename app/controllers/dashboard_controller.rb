# Dashboard Controller
class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    authorize! :view, :dashboard
  end
end
