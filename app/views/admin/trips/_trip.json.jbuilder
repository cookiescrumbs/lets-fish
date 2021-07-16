json.extract! trip, :id, :title, :short_address, :description, :date, :created_at, :updated_at
json.url trip_url(trip, format: :json)
