# frozen_string_literal: true

require 'northern_pike'
require 'httparty'

namespace :waters do
  desc 'Add waters from a JSON file'
  task :add_waters_from_file do
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
end
