module ApplyJobHelper
  def applied?(user_id)
    @apply_job = ApplyJob.find_by(user_id: user_id, job_id: params[:id].to_i)
    if @apply_job.nil?
      false
    else
      true
    end
  end

  def applied_to_job?(user_id,job_id)
    @apply_job = ApplyJob.find_by(user_id: user_id, job_id:job_id)
    if @apply_job.nil?
      false
    else
      true
    end
  end
end
