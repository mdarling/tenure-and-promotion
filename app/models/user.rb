class User < ActiveRecord::Base
  belongs_to :department
  belongs_to :role
  #Categories belong to each user.
  has_many :categories, dependent: :destroy
  has_many :recusals, dependent: :destroy
  has_attached_file :dossier
  do_not_validate_attachment_file_type :dossier
  # A net ID may only be registered once
  validates :netid, presence: true, uniqueness: true

  def level
    role[:level]
  end
end
