# geojson format
# https://developers.google.com/maps/tutorials/data/importing_data#what_is_geojson
# http://geojson.org/geojson-spec.html

json.array!(@fisheries) do |fishery|
  lat_lng = fishery.lat_lng.split(',')
  json.extract! fishery, :id, :name
  json.lat lat_lng[0]
  json.lng lat_lng[1]
  json.url admin_fishery_url(fishery, format: :json)
end