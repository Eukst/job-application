module JobsHelper
  def get_user_id(job)
    @job=job
    if @job.new_record?
      current_user.id
    else
      @job.user_id
    end
  end
end

# job.new_record? ?  current_user.id :  job.id ;