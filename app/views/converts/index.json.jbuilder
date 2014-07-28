json.array!(@converts) do |convert|
  json.extract! convert, :id, :cid, :url, :step
  json.url convert_url(convert, format: :json)
end
