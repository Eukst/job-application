# frozen_string_literal:true

# to make user form
class AddUserFormToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :address, :text, null: false
    add_column :users, :mobile_no, :integer, null: false
    add_column :users, :city, :string, null: false
    add_column :users, :state, :string, null: false
    add_column :users, :user_role, :string
    add_column :users, :admin, :boolean , default:false
    add_column :users, :pincode, :integer, null: false
  end
end
