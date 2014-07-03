class CreateCandidateProfiles < ActiveRecord::Migration
  def change
    create_table :candidate_profiles do |t|
      t.integer :candidate_profile_id
      t.text :Curriculum_Vitae
      t.text :Teaching_Statement
      t.text :Research_Statement
      t.text :Service_statement_in
      t.text :Additional_Materials
      t.integer :user_id
      t.integer :User_department_id

      t.timestamps
    end
  end
end
