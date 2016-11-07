class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 1 }
  belongs_to :user
  validates_presence_of :date, :rationale
end
