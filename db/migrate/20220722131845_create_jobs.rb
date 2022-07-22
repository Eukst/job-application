# frozen_string_literal:true

# class for jobs
class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job_title
      t.decimal :experience
      t.decimal :salary

      t.timestamps
    end
  end
end
