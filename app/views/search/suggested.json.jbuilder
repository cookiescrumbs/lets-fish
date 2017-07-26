json.array! @waters do |water|
  json.name water.name.strip  + ' - ' + water.address
  json.url fishery_water_path water.fishery, water
end

json.array! @fisheries do |fishery|
  json.name fishery.name.strip + ' - ' + fishery.address.short
  json.url fishery_path fishery
end
