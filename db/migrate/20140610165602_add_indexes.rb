class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :committee_evaluations,  :review_id
  	add_index :committee_evaluations, :committee_id
  	add_index :committee_evaluations, :review_candidate_profile_id
  	add_index :candidate_profiles, :user_id
  	add_index :candidate_profiles, :User_department_id
  	add_index :committees, :department_id
  	add_index :committees, :department_college_id
  	add_index :departments, :College_id
  	add_index :reviews, :candidate_profile_id
  	add_index :reviews, :committee_id
  	add_index :reviews, :committee_department_id
  	add_index :reviews, :committee_department_college_id
  	add_index :users, :department_id
  	add_index :users, :committee_id
  	add_index :users, :department_college_id
  	add_index :votes, :review_id
  	add_index :votes, :candidate_profile_id
  	add_index :votes, :user_id
  end
end
