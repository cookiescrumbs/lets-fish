json.markers do
  json.array! @markers, :id, :name, :lat, :lng, :icon
end

json.results render template: 'search/_results.html.erb'
