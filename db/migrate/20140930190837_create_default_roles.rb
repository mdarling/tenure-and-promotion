class CreateDefaultRoles < ActiveRecord::Migration
  def change
    create_table :default_roles do |t|
      t.string :role
      t.string :owner

      t.timestamps
    end
  end
end
