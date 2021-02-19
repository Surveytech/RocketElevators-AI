# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.employee?
      can :manage, :all
    elsif user.regular?
      can :read, Quote, user_id: user.id
      can :create, Quote
      can :update, Quote do |quote|
        quote.try(:user) == user
      end
      can :destroy, Quote do |quote|
        quote.try(:user) == user
      end
    else
      can :read #, Quote
    end
  end
end

# class Ability
#   include CanCan::Ability
#   def initialize(user)
#     can :read, :all                 # allow everyone to read everything
#     return unless user && user.admin?
#     can :access, :rails_admin       # only allow admin users to access Rails Admin
#     can :read, :dashboard           # allow access to dashboard
#     if user.role? :superadmin
#       can :manage, :all             # allow superadmins to do anything
#     elsif user.role? :manager
#       can :manage, [User, Product]  # allow managers to do anything to products and users
#     elsif user.role? :sales
#       can :update, Product, hidden: false  # allow sales to only update visible products
#     end
#   end
# end
