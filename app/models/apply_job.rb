# frozen_string_literal:true

# class for Association M2M
class ApplyJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :user_id, presence: true, uniqueness: true
  validates :job_id, presence: true, uniqueness: true
end
