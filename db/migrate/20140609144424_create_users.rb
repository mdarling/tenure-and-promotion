class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.integer :acces_level
      t.integer :Department_id
      t.boolean :is_faculty
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :Committee_id
      t.integer :Department_College_id

      t.timestamps
    end
  end
end
