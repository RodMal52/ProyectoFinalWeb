json.array!(@create_table_candidate_events) do |create_table_candidate_event|
  json.extract! create_table_candidate_event, :id, :candidate_id, :event_id, :assistance
  json.url create_table_candidate_event_url(create_table_candidate_event, format: :json)
end
