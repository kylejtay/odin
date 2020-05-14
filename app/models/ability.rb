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
    can :read, Project, company_id: user.company_id
    can :read, TimeEstimate, company_id: user.company_id
    can :read, BillableHour, company_id: user.company_id
  end

  def add_admin_abilities(user)
    can :create, Project
    can %i[read update destroy], Project, company_id: user.company_id
    can :create, User
    can %i[read update destroy], User, company_id: user.company_id
    can :crud, TimeEstimate, company_id: user.company_id
    can :crud, BillableHour, company_id: user.company_id
  end
end
