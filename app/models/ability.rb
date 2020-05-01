class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :create, :update, :destroy, to: :write
    alias_action :cancel_confirm, to: :cancel

    add_user_abilities(user)
  end

  private

  def add_user_abilities(user)
    can :crud, Project
    can :crud, TimeEstimate
  end
end
