json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :last_name, :cellphone, :account_id
  json.url candidate_url(candidate, format: :json)
end
