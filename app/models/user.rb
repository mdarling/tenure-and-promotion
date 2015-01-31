class User < ActiveRecord::Base
  #Categories belong to each user.
  has_many :categories, dependent: :destroy
  #Some users can create other users.
  has_many :owned_roles, dependent: :destroy
  # A net ID may only be registered once
  validates :netid, presence: true, uniqueness: true
end
