class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :review_id
      t.integer :candidate_profile_id
      t.integer :commitee_id
      t.datetime :begin
      t.datetime :end
      t.string :college_type
      t.integer :committee_id
      t.integer :committee_department_id
      t.integer :committee_department_college_id

      t.timestamps
    end
  end
end
