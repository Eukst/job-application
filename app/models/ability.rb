# frozen_string_literal: true

# to implement authorozation
class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.admin?

    if user.user_role.include? 'Employer'
      can :create, Job

      can :update, Job do |job|
        job.user == user
      end
      can :edit, Job do |job|
        job.user == user
      end

      can :destroy, Job do |job|
        job.user == user
      end
      can :show, Job do |job|
        job.user == user
      end
      can :index, Job do |job|
        job.user == user
      end
    end
    if !user.admin? && (user.user_role.include? 'Job Seeker')
      can :index, Job
      can :show, user_profiles,User do |user|
        user.id = user.id
      
      end

    end
  end
end
