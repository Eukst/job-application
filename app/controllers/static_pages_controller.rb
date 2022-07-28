# frozen_string_literal:true

# class for static pages
class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && (current_user.user_role.include? 'Employer')
      @jobs = Job.where(user_id: current_user.id)

      @jobs_paginate = @jobs.page params[:page]

      jobs_ids = Job.where(user_id: current_user.id).pluck(:id)
      apply_user_ids = ApplyJob.where('job_id IN (?)', jobs_ids).pluck(:user_id).uniq
      @user_apply = User.where(id: apply_user_ids)
    end

    if user_signed_in? && (current_user.user_role.include? 'Job Seeker') && (current_user.admin == false)
      @jobs = Job.all
      @jobs =Kaminari.paginate_array(@jobs).page(params[:page]).per(8) 

    end
    if user_signed_in? && (current_user.admin == true)
      @jobs = Job.all
      @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(8)

    end
  end

  def help; end

  def contact; end

  def about; end

  def dashbord_users
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
  end
end
