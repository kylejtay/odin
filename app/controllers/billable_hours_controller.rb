class BillableHoursController < ApplicationController
  layout 'dashboard'
  authorize_resource

  def index
    @start_time = if params[:start_time].nil?
                    Time.now.monday
                  else
                    Time.parse(params[:start_time]).monday
                  end
    @period = 7
    @period = params['period'].to_i if params['period'].present?
    @users = current_user.company.users.includes(:projects, :billable_hours)
  end

  def show
  end

  def new
  end

  def create
    params[:billable_hours].each do |billable_hour|
      user_id = billable_hour[0].to_i;
      billable_hour[1].each do |project|
        project_id = project[0].to_i
        project[1].each do |date|
          datetime = Date.parse(date[0])
          date[1].each do |hours|
            length = hours[1][0].to_f
            BillableHour.upsert(
              { start_time: datetime, end_time: datetime + length.hours, hours: length, user_id: user_id, project_id: project_id },
            unique_by: %i[ start_time user_id project_id ])
          end
        end
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

