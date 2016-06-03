json.markers do
  json.array! @waters, :id, :name, :latitude, :longitude
end

json.results render template: 'search/_results.html.erb', object: @water
