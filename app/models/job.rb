# frozen_string_literal:true

# class job
class Job < ApplicationRecord
  belongs_to :user
  has_many :apply_jobs
  has_many :users, through: :apply_jobs
end
