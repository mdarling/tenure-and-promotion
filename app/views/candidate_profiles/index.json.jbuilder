json.array!(@candidate_profiles) do |candidate_profile|
  json.extract! candidate_profile, :id, :candidate_profile_id, :Curriculum_Vitae, :Teaching_Statement, :Research_Statement, :Service_statement_in, :Additional_Materials, :user_id, :User_department_id
  json.url candidate_profile_url(candidate_profile, format: :json)
end
