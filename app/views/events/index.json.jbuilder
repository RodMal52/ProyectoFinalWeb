json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :capacity, :date
  json.url event_url(event, format: :json)
end