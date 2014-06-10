json.array!(@votes) do |vote|
  json.extract! vote, :id, :vote_id, :Review_id, :Review_Candidate_Profile_id, :user_id
  json.url vote_url(vote, format: :json)
end
