class Ability
  include CanCan::Ability

  def initialize(user)
    if user && (user.readonly_admin? || user.super_admin?)
      can :access, :rails_admin
      can :dashboard
      can :read, :all
    end

    # Only for super admin
    if user.super_admin?
      can :manage, :all
    end
  end
end
