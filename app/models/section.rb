class Section < ActiveRecord::Base
  has_many :department_sections, dependent: :destroy
end
