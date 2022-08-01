# frozen_string_literal:true

# Apply jobs controller for apply and destroy job
class ApplyJobsController < ApplicationController
  before_action :authenticate_user!
  # post apply_jobs
  def create
    if user_signed_in? && (current_user.user_role.include? 'Job Seeker')
      @apply_job = ApplyJob.create(user_id: params[:user_id].to_i, job_id: params[:job_id].to_i)
      if @apply_job.valid?
        @apply_job.save
        job = Job.find(params[:job_id].to_i)
        ApplyingJobMailer.apply(job, current_user).deliver
        flash[:success] = 'Applied to Job  Successfully '
        respond_to do |format|
          format.html { redirect_to job_path(params[:job_id].to_i) }
          format.json { head :no_content }
          format.js   { render layout: false }
        end

      else
        flash[:error] = 'Already applied for job'
        respond_to do |format|
          format.html { redirect_to job_path(params[:job_id].to_i) }
          format.json { head :no_content }
          format.js   { render layout: false }
        end
      end
    end
  end

  # delete apply_jobs/:id
  def destroy
    @apply_job = ApplyJob.find_by(user_id: params[:user_id].to_i, job_id: params[:job_id].to_i)
    @apply_job.destroy
    job = Job.find(params[:job_id].to_i)
    ApplyingJobMailer.cancel(job, current_user).deliver
    respond_to do |format|
      format.html { redirect_to job_path(params[:job_id].to_i) }
      format.json { head :no_content }
      format.js   { render layout: false }
    end
  end
end
