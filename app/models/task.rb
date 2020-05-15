class Task < ApplicationRecord
  belongs_to :project
  has_and_belongs_to_many :users
  has_many :time_estimates
end
