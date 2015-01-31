class Department < ActiveRecord::Base
  belongs_to :college
  has_many :users, dependent: :destroy
  has_many :department_sections, dependent: :destroy
  has_many :sections, through: :department_sections
end
