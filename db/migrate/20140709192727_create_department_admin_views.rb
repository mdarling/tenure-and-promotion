class CreateDepartmentAdminViews < ActiveRecord::Migration
  def change
    create_table :department_admin_views do |t|

      t.timestamps
    end
  end
end
