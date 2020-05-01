class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :time_estimates

  def future_hours
    hours = 0
    estimates = time_estimates.where('start_time >= ?', Time.now.beginning_of_day)
    estimates.each do |estimate|
      hours += estimate.hours
    end
    hours
  end
end
