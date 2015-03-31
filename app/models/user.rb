class User < ActiveRecord::Base
  belongs_to :department
  has_one :college, through: :department
  belongs_to :role
  #Categories belong to each user.
  has_many :categories, dependent: :destroy
  has_many :recusals, dependent: :destroy
  has_attached_file :dossier
  do_not_validate_attachment_file_type :dossier
  enum phase: [ :candidate, :department, :college, :provost ]
  # A net ID may only be registered once
  validates :netid, presence: true, uniqueness: true

  def level
    role[:level]
  end

  def level= new_level
    update role: Role.find_by_level(new_level)
  end

end
