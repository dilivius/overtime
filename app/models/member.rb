class Member < ApplicationRecord
  belongs_to :user
  belongs_to :member, class_name: 'User'
end
