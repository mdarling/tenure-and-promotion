json.array!(@colleges) do |college|
  json.extract! college, :id, :college_id, :name
  json.url college_url(college, format: :json)
end
