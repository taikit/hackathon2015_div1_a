json.array!(@battles) do |battle|
  json.extract! battle, :id, :win_ankle_id, :lose_ankle_id, :user_id
  json.url battle_url(battle, format: :json)
end
