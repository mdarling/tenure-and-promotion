class DepartmentSection < ActiveRecord::Base
  belongs_to :department
  belongs_to :section
end
