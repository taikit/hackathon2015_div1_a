json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :ankle_id, :body
  json.url comment_url(comment, format: :json)
end
