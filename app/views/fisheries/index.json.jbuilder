json.array!(@fisheries) do |fishery|
  json.extract! fishery, :id
  json.url fishery_url(fishery, format: :json)
end
