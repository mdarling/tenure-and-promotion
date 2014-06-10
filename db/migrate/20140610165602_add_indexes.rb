class AddIndexes < ActiveRecord::Migration
  def change
    remove_column :candidate_profiles, :candidate_profile_id
    remove_column :colleges, :college_id
    remove_column :committee_evaluations, :committee_evaluation_id
    remove_column :committees, :committee_evaluation_id
    remove_column :departments, :department_id
    remove_column :reviews, :review_id
    remove_column :users, :user_id
    remove_column :votes, :vot_id
    remove_column :reviews, :commitee_id
    add_index :candidate_profiles, :user_id
    add_index :candidate_profiles, :User_department_id
    add_index :committee_evaluations, :committee_id
    add_index :committee_evaluations, :committee_department_id
    add_index :committee_evaluations, :committee_department_college_id
    add_index :committee_evaluations, :review_id
    add_index :committee_evaluations, :review_candidate_profile_id
    add_index :committees, :department_id
    add_index :committees, :department_college_id
    add_index :departments, :college_id
    add_index :reviews, :candidate_profile_id
    add_index :reviews, :committee_id
    add_index :reviews, :committee_department_id
    add_index :reviews, :committee_department_college_id
    add_index :users, :Committee_id
    add_index :users, :Department_id
    add_index :users, :Department_College_id
    add_index :votes, :Review_id
    add_index :votes, :Review_Candidate_Profile_id
    add_index :votes, :user_id
  end
end
