class Category < ActiveRecord::Base
  #Each user has Categories
  belongs_to :user
  #Each category has files (Uploads) attached to it
  has_many :uploads, dependent: :destroy
  has_many :converts, dependent: :destroy
end
