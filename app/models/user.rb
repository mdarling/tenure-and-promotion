class User < ActiveRecord::Base
  #Categories belong to each user.
  has_many :Categories, dependent: :destroy
  #Some users can create other users.
  has_many :owned_roles, dependent: :destroy
end
