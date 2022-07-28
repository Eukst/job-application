# frozen_string_literal:true

# User class
class User < ApplicationRecord
  paginates_per 5
  max_paginates_per 7
  has_many :jobs, dependent: :destroy
  has_many :apply_jobs
  has_many :jobs, through: :apply_jobs
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # validation
  VALID_PIN_REGEX = /[1-9]{1}[0-9]{5}/

  validates :first_name, :last_name, :address, :mobile_no, :city, :state, :user_role, presence: true
  validates :pincode, presence: true, format: { with: VALID_PIN_REGEX }, length: { is: 6 }
  validates :mobile_no, length: { minimum: 10, maximum: 15 }
end
