# frozen_string_literal:true

# class job
class Job < ApplicationRecord
  paginates_per 5
  max_paginates_per 7
  belongs_to :user
  has_many :apply_jobs
  has_many :users, through: :apply_jobs
  validates :job_title, :experience, :salary, :description, presence: true
end
