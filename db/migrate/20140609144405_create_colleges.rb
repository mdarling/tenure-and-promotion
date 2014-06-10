class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.integer :college_id
      t.string :name

      t.timestamps
    end
  end
end
