class CreateDepartmentSections < ActiveRecord::Migration
  def change
    create_table :department_sections do |t|
      t.references :department, index: true
      t.references :section, index: true

      t.timestamps null: false
    end
    add_foreign_key :department_sections, :departments
    add_foreign_key :department_sections, :sections
  end
end
