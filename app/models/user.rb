class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :audit_logs
  has_many :members_associations, class_name: 'Member'
  has_many :members, through: :members_associations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :email, :phone, :ssn, :company

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: {is: 10}
  validates :ssn, length: {is: 4}
  validates_numericality_of :ssn

  def full_name
    "#{last_name}, #{first_name}"
  end
end
