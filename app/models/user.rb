# frozen_string_literal:true

# User class
class User < ApplicationRecord
  has_many :jobs, dependent: :destroy
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # validation
  VALID_PIN_REGEX = /[1-9]{1}[0-9]{5}/

  validates :first_name, :last_name, :address, :mobile_no, :city, :state, :user_role, presence: true
  validates :pincode, presence: true, format: { with: VALID_PIN_REGEX }, length: { is: 6 }
end
