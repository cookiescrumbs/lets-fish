json.array!(@admin_water_types) do |admin_water_type|
  json.extract! admin_water_type, :id
  json.url admin_water_type_url(admin_water_type, format: :json)
end
