class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def after_accept_path_for(_resource)
    dashboard_path
  end
end
