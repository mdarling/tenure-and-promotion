class CreateRecusals < ActiveRecord::Migration
  def change
    create_table :recusals do |t|
      t.references :user, index: true
      t.references :candidate, index: true

      t.timestamps null: false
    end
    add_foreign_key :recusals, :users
    add_foreign_key :recusals, :candidates
  end
end
