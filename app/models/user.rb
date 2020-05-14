class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_and_belongs_to_many :projects
  has_many :time_estimates
  has_many :billable_hours

  def full_name
    first_name + " " + last_name
  end

  def billed_hours
    hours = 0
    billed_hours = billable_hours.where('start_time <= ?', Time.now.beginning_of_day)
    billed_hours.each do |billed|
      hours += billed.hours
    end
    hours
  end

  def future_hours
    hours = 0
    estimates = time_estimates.where('start_time >= ?', Time.now.beginning_of_day)
    estimates.each do |estimate|
      hours += estimate.hours
    end
    hours
  end
end
