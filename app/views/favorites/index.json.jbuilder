json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :user_id, :ankle_id
  json.url favorite_url(favorite, format: :json)
end
