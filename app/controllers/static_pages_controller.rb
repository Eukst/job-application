# frozen_string_literal:true

# class for static pages
class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && (current_user.user_role.include? 'Employer')
      @jobs = Job.where(user_id: current_user.id)
      jobs_ids = Job.where(user_id: current_user.id).pluck(:id)
      apply_user_ids = ApplyJob.where('job_id IN (?)', jobs_ids).pluck(:user_id).uniq
      @user_apply = User.where(id: apply_user_ids)

    end
  end

  def help; end

  def contact; end

  def about; end
end
