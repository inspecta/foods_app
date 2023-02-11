class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Recipe

    # Only owner of a recipe can delete it
    can :read, :all
    can :manage, Recipe, user_id: user.id

    # Show public recipe to owner also
    can :show, Recipe, user_id: user.id
  end
end
