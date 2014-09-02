class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :netid
      t.string :name
      t.string :role
      t.string :department

      t.timestamps
    end
  end
end
