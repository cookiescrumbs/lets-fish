# frozen_string_literal: true

require 'northern_pike'
require 'httparty'

namespace :waters do
  desc 'Add waters from a JSON file'
  task :add_waters_from_assynt_anglers_file do
    waters = JSON.parse(File.read(Dir.pwd + '/lib/tasks/json_files/assynt-angling-group.json'))
    waters.each do |water|
      body = {
        water: {
          name: water['name'].first,
          description: water['description'].join("\n"),
          latitude: water['lat_lng'].strip.split(',')[0],
          longitude: water['lat_lng'].strip.split(',')[1],
          water_type_id: 1,
          species_ids: [1],
          address: 'Assynt, Scotland'
        }
      }

      begin
        response = HTTParty.post('http://lets.fish/api/water/fishery/assynt-angling-group', body: body.to_json, headers: { 'Content-Type' => 'application/json' })
        p response
        p body
      rescue StandardError => e
        p e
        p body
      end
    end
  end

  desc 'Clean waters and add waters from json file'
  task :add_waters_from_forsinard_file do
    waters = JSON.parse(File.read(Dir.pwd + '/lib/tasks/json_files/forsinard-fly-fishers.json'))
    waters.each do |water|
      location = NorthernPike.os_reference_to_lat_lng(os_ref: "NC" + water['lat_lng'][0].gsub(/[^\d]/, ''))
      description = water['description'][0].gsub(%r{</?[^>]+?>}, '')
      body = {
        water: {
          name: water['name'],
          description: description,
          latitude: location[:lat],
          longitude: location[:lng],
          water_type_id: 1,
          species_ids: [1],
          address: 'Forsinard, Scotland'
        }
      }
      begin
        response = HTTParty.post('http://lets.fish/api/water/fishery/', body: body.to_json, headers: { 'Content-Type' => 'application/json' })
        p response
        p body
      rescue StandardError => e
        p e
        p body
      end
    end
  end
end
