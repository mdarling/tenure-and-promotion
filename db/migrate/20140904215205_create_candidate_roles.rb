class CreateCandidateRoles < ActiveRecord::Migration
  def change
    create_table :candidate_roles do |t|
      t.string :role

      t.timestamps
    end
  end
end
