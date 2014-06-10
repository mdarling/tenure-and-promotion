class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_id
      t.integer :Review_id
      t.integer :Review_Candidate_Profile_id
      t.integer :user_id

      t.timestamps
    end
  end
end
