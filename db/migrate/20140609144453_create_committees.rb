class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.integer :committee_id
      t.string :name
      t.integer :department_id
      t.integer :department_college_id

      t.timestamps
    end
  end
end
