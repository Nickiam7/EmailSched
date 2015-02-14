json.array!(@emails) do |email|
  json.extract! email, :id, :name, :starts_at, :qty, :pre
  json.url email_url(email, format: :json)
end
