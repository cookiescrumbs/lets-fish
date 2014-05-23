json.array!(@waters) do |water|
  json.extract! water, :id
  json.url water_url(water, format: :json)
end
