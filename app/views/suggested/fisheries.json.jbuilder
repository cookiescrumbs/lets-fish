json.array! @fisheries do |fishery|
  json.name fishery.name.strip + ' - ' + fishery.address.short
  json.url fishery_path fishery
end
