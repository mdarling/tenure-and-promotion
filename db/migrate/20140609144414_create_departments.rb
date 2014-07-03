class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :department_id
      t.string :name
      t.integer :College_id

      t.timestamps
    end
  end
end
