module ApplyJobHelper
    def applied?(user_id)
        @apply_job = ApplyJob.find_by(user_id:user_id,job_id:params[:id].to_i)
        if @apply_job.nil?
            return false
        else
            return true
        end
    end
end

