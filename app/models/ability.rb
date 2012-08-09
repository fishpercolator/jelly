class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest
    if user.has_role? :admin
      can :manage, :all
    elsif !user.new_record?
      can :read, :all
      can :create, Report
      can :manage, Report do |report|
        report.user == user
      end
    end
    # Anonymous users can't do anything yet
  end
end
