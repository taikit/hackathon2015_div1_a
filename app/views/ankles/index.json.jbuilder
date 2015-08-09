json.array!(@ankles) do |ankle|
  json.extract! ankle, :id, :image
  json.url ankle_url(ankle, format: :json)
end
