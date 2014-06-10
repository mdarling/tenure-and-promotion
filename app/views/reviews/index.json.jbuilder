json.array!(@reviews) do |review|
  json.extract! review, :id, :review_id, :candidate_profile_id, :commitee_id, :begin, :end, :college_type, :committee_id, :committee_department_id, :committee_department_college_id
  json.url review_url(review, format: :json)
end
