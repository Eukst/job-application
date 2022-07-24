json.extract! job, :id, :job_title, :experience, :salary, :created_at, :updated_at,:user_id
json.url job_url(job, format: :json)
