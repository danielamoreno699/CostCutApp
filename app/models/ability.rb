# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    class Ability
      include CanCan::Ability
    
      def initialize(user)
        user ||= User.new 
    
        return unless user.id.present?
    
        can :manage, Group, author_id: user.id
        can :manage, Operation, author_id: user.id
      end
    end
  end
end
