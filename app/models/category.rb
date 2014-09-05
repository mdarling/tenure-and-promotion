class Category < ActiveRecord::Base
  #Each user has Categories
  belongs_to :user
  #Each category has files (Uploads) attached to it
  has_many :Uploads, dependent: :destroy
  has_many :Converts, dependent: :destroy
end
