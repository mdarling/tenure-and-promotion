class RemoveOwnerFromDefaultRoles < ActiveRecord::Migration
  def change
    remove_column :default_roles, :owner, :string
  end
end
