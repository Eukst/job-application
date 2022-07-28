# frozen_string_literal:true

# class to update data type of mobile no
class AddMobileNoToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mobile_no, :bigint
  end
end
