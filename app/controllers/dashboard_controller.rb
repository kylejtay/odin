# Dashboard Controller
class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  def index
    authorize! :view, :dashboard
    @x_axis = ((Time.now - 90.days).to_date..(Time.now + 90.days).to_date).select(&:saturday?).map(&:to_s)
    @total_hours_worked = TimeEntry.weekly_totals(90, current_user.company)
    @weekly_billed = TimeEntry.weekly_billed(90, current_user.company)
    @total_hours_forecasted = TimeEstimate.weekly_totals(90, current_user.company)
    @weekly_goal_hours = current_user.company.weekly_goal_hours(90)
  end
end
