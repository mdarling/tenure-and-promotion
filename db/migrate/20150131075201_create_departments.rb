class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.references :college, index: true

      t.timestamps null: false
    end
    add_foreign_key :departments, :colleges
  end
end
