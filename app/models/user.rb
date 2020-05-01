class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company
  has_and_belongs_to_many :projects
  has_many :time_estimates

  def full_name
    first_name + " " + last_name
  end
end
