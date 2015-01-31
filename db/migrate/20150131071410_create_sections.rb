class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :level
      t.boolean :pdf

      t.timestamps null: false
    end
  end
end
