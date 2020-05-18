class Company < ApplicationRecord
  has_many :users
  has_many :projects
  has_many :time_entries, through: :users
  has_many :time_estimates, through: :users

  def weekly_goal_hours(period)
    weeks = ((Time.now - 90.days).to_date..(Time.now + 90.days).to_date).select(&:saturday?).map(&:to_s)
    totals = []

    weeks.each do |week|
      totals.push(users.count * 32)
    end
    totals
  end
end
