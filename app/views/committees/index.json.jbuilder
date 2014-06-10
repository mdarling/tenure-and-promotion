json.array!(@committees) do |committee|
  json.extract! committee, :id, :committee_id, :name, :department_id, :department_college_id
  json.url committee_url(committee, format: :json)
end
