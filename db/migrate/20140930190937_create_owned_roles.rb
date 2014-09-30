class CreateOwnedRoles < ActiveRecord::Migration
  def change
    create_table :owned_roles do |t|
      t.string :role
      t.references :user, index: true

      t.timestamps
    end
  end
end
