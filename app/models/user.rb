# frozen_string_literal:true

# User class
class User < ApplicationRecord
  has_many:jobs
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # validation
  VALID_PIN_REGEX = /[1-9]{1}[0-9]{5}/

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :mobile_no, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :user_role, presence: true
  validates :pincode, presence: true,format: { with: VALID_PIN_REGEX },length: {is: 6}
end
