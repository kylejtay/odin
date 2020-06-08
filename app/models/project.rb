class Project < ApplicationRecord
  belongs_to :company
  has_many :time_entries
  has_many :tasks
  has_many :users, -> { distinct }, through: :tasks
  has_many :time_estimates, -> { distinct }, through: :tasks
  has_many :time_entries, -> { distinct }, through: :tasks
  enum billing_type: [:fixed, :time_and_materials]
  accepts_nested_attributes_for :tasks,
    allow_destroy: true,
    :reject_if => proc { |att| att[:title].blank? }
  default_scope { order(title: :asc) }

  def billed_hours
    hours = 0
    billed_hours = time_entries.where('start_time <= ?', Time.now.beginning_of_day)
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
