json.extract! post, :id, :description, :latitude, :longitude, :date, :created_at, :updated_at
json.url post_url(post, format: :json)
