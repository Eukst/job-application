# frozen_string_literal:true

class AddDespToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :description, :text
  end
end
