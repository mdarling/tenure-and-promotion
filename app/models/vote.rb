class Vote < ActiveRecord::Base
	validates_presence_of :vote_id
	validates_presence_of :Review_id
	validates_presence_of :Review_Candidate_Profile_id
	validates_presence_of :user_id
end
