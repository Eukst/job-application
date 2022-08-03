# frozen_string_literal:true

# class for static pages
class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  # root_path  static_pages/home
  def home
    if user_signed_in? && (current_user.user_role.include? 'Employer')
      @jobs = Job.where(user_id: current_user.id)
      @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(7)
      jobs_ids = Job.where(user_id: current_user.id).pluck(:id)
      apply_user_ids = ApplyJob.where('job_id IN (?)', jobs_ids).pluck(:user_id).uniq
      @user_apply = User.where(id: apply_user_ids)
    end
    # current_user.admin == false or !current_user.admin
    if user_signed_in? && (current_user.user_role.include? 'Job Seeker') && !current_user.admin
      @jobs = Job.all
      @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(7)
    end

    if user_signed_in? && current_user.admin
      @jobs = Job.all
      @jobs = Kaminari.paginate_array(@jobs).page(params[:page]).per(7)
    end
  end

  def help; end

  def contact; end

  def about; end

  # static_pages_dashbord_users_path   static_pages/dashbord_users
  def dashbord_users
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(5)
  end
end
