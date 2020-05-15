class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :update, :destroy, to: :write

    add_user_abilities(user)
    add_admin_abilities(user) if user.admin?
  end

  private

  def add_user_abilities(user)
    can :view, :dashboard if user['permissions'][0]['dashboard'].to_i > 0
    can :read, :other_forecasts if user['permissions'][0]['forecasting'].to_i > 0
    can :edit, :other_forecasts if user['permissions'][0]['forecasting'].to_i > 1
    can :read, Project, company_id: user.company_id if user['permissions'][0]['projects'].to_i > 0
    can :crud, Project, company_id: user.company_id if user['permissions'][0]['projects'].to_i > 1
    can :read, User, company_id: user.company_id if user['permissions'][0]['team'].to_i > 0
    can %i[create update destroy], User, company_id: user.company_id if user['permissions'][0]['team'].to_i > 1
    can :read, TimeEstimate, company_id: user.company_id
    can :read, TimeEntry, company_id: user.company_id
  end

  def add_admin_abilities(user)
    can :view, :dashboard
    can :read, :other_forecasts
    can :edit, :other_forecasts
    can :crud, Project, company_id: user.company_id
    can :crud, User, company_id: user.company_id
    can :crud, TimeEstimate, company_id: user.company_id
    can :crud, TimeEntry, company_id: user.company_id
  end
end
