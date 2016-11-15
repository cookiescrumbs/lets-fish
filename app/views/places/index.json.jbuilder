json.markers do
  json.array! @markers, :id, :name, :lat, :lng, :icon
end