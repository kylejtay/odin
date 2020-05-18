class TimeEstimate < ApplicationRecord
  belongs_to :user
  belongs_to :task

  def self.weekly_totals(period, company)
    weeks = ((Time.now - 90.days).to_date..(Time.now + 90.days).to_date).select(&:saturday?).map(&:to_s)
    entries = company.time_estimates
    totals = []

    weeks.each do |week|
      week_total = 0
      entries.each do |entry|
        week_total += entry.hours if entry.start_time.between?((week.to_time-7.days), week.to_time)
      end
      totals.push(week_total)
    end
    totals
  end
end
