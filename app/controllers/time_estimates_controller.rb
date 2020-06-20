class TimeEstimatesController < ApplicationController
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
    if can? :read, :other_forecasts
      @users = current_user.company.users.includes(:projects, :tasks, :time_estimates).order('first_name ASC')
    else
      @users = User.where(id: current_user.id).includes(:projects, :tasks, :time_estimates).order('first_name ASC')
    end
  end

  def show
  end

  def new
  end

  def create
    params[:time_estimates].each do |time_estimate|
      user_id = time_estimate[0].to_i;
      time_estimate[1].each do |project|
        task_id = project[0].to_i
        project[1].each do |date|
          datetime = Date.parse(date[0])
          date[1].each do |hours|
            length = hours[1][0].to_f
            time_estimate = TimeEstimate.where(start_time: datetime, user_id: user_id, task_id: task_id).first
            if time_estimate.present?
              time_estimate.update(start_time: datetime, end_time: datetime + length.hours, hours: length, user_id: user_id, task_id: task_id)
            elsif length > 0
              TimeEstimate.create(start_time: datetime, end_time: datetime + length.hours, hours: length, user_id: user_id, task_id: task_id)
            end
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

