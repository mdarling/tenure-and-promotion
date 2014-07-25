class Department < ActiveRecord::Base
	has_one :department_admin_view

	def real_name
		"#{self.name}"
	end
end
