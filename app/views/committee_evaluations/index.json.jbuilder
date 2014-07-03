json.array!(@committee_evaluations) do |committee_evaluation|
  json.extract! committee_evaluation, :id, :committee_evaluation_id, :committee_id, :committee_department_id, :committee_department_college_id, :review_id, :review_candidate_profile_id
  json.url committee_evaluation_url(committee_evaluation, format: :json)
end
