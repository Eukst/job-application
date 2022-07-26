# frozen_string_literal:true

# class to establish M2M relationship between User and Job
class CreateApplyJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :apply_jobs do |t|
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
    add_index :apply_jobs, %i[user_id job_id], unique: true
  end
end
