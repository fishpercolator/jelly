class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Report
      can :manage, Report do |report|
        report.user == user
      end
    end
  end
end
