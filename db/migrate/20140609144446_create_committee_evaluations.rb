class CreateCommitteeEvaluations < ActiveRecord::Migration
  def change
    create_table :committee_evaluations do |t|
      t.integer :committee_evaluation_id
      t.integer :committee_id
      t.integer :committee_department_id
      t.integer :committee_department_college_id
      t.integer :review_id
      t.integer :review_candidate_profile_id

      t.timestamps
    end
  end
end
