# frozen_string_literal:true

# controller to manage apply to job and withdraw job application
class ApplyJobsController < ApplicationController
  def show
    if user_signed_in? && (current_user.user_role.include? 'Job Seeker')
      job_id = params[:id].to_i
      user_id = current_user.id
      @apply_job = ApplyJob.create(user_id: user_id, job_id: job_id)
      if @apply_job.valid?
        @apply_job.save
        flash[:success] = 'Applied to Job  Successfully '

      end
    end
  end

  def destroy; end
end
