json.array!(@departments) do |department|
  json.extract! department, :id, :department_id, :name, :College_id
  json.url department_url(department, format: :json)
end
