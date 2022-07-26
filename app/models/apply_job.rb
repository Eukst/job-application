# frozen_string_literal:true

# class for Association M2M
class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  #validates :apply_job, uniqueness: { scope: [:user_id, :job_id] }
  validates :job_id, uniqueness: { scope: [:user_id] }


end
