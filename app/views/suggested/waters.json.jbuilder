json.array! @waters do |water|
  json.name water.name.strip  + ' - ' + water.address
  json.url fishery_water_path water.fishery, water
end
