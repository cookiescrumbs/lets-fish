# # frozen_string_literal: true

# require 'northern_pike'
# require 'nokogiri'
# require 'open-uri'

# namespace :OS_maps do
#   desc 'Take the existing GEOJSON OS maps file convert the bounding box to lat,lng for each OS map and save with the maps metadata to a OS-maps json file'
#   task :create_OS_maps_json_file do
#       os_maps = JSON.parse(File.read(Dir.pwd + '/lib/tasks/json_files/os-maps.json'))['features']
#       os_maps_out = os_maps.map do |os_map|
#         a, b, c, d, e, f = os_map['geometry']['bbox']
#         sw_corner = NorthernPike.easting_northing_to_lat_lng(easting: a.to_f , northing: b.to_f)
#         ne_corner = NorthernPike.easting_northing_to_lat_lng(easting: d.to_f, northing: e.to_f)
#         properties = os_map['properties']

#         begin
#           doc = Nokogiri::HTML(URI.open(properties['url']))
#           images = doc.css('.placeholder__wrapper >  img').map{|img| img.attr('src') }
#         rescue 
#           images = []
#         end 

#         {
#           sheet: properties['SHEET'],
#           url:  properties['url'],
#           title:  properties['TITLE'],
#           sub_title:  properties['SUB_TITLE'],
#           series: properties['SERIES'],
#           images: images,
#           bounding_box: [sw_corner, ne_corner]
#         }
  
#       end
#       File.write(Dir.pwd + '/lib/tasks/json_files/out/os-maps.json', os_maps_out.to_json)
#   end
# end
