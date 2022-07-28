# frozen_string_literal:true

# apply job helper contain methods to verify a user applied for job or not 
module ApplyJobHelper
  # Return a user already applied for job or not
  def applied?(user_id)
    @apply_job = ApplyJob.find_by(user_id: user_id, job_id: params[:id].to_i)
    return false if @apply_job.nil?

    true
  end

  # Return a user already applied for job or not (takes two parameter)
  def applied_to_job?(user_id, job_id)
    @apply_job = ApplyJob.find_by(user_id: user_id, job_id: job_id)
    return false if @apply_job.nil?

    true
  end
end
