json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :acces_level, :Department_id, :is_faculty, :first_name, :last_name, :email, :Committee_id, :Department_College_id
  json.url user_url(user, format: :json)
end
