class TimeEstimatesController < ApplicationController
  layout 'dashboard'
  authorize_resource

  def index
    @start_time = if params[:start_time].nil?
                    Time.now.monday
                  else
                    Date.parse(params[:start_time]).monday
                  end

    @time_estimates = TimeEstimate.where('start_time BETWEEN ? AND ?', @start_time, @start_time + 7.days).order('start_time ASC')
  end

  def show
  end

  def new
  end

  def create
    user = current_user
    user = User.find(params[:user_id]) if params[:user_id].present?
    params[:time_estimates].each do |time_estimate|
      project_id = time_estimate[0].to_i;
      time_estimate[1].each do |date|
        datetime = Date.parse(date[0])
        date[1].each do |hours|
          length = hours[1][0].to_i
          TimeEstimate.upsert(
            { start_time: datetime, end_time: datetime + length.hours, hours: length, user_id: user.id, project_id: project_id },
          unique_by: %i[ start_time user_id project_id ])
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

