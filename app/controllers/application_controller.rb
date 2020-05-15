class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    flash[:notice] = 'You do not have access to that page'
    redirect_to time_estimates_path
  end

  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def after_accept_path_for(_resource)
    dashboard_path
  end
end
