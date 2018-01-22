# frozen_string_literal: true

require 'northern_pike'
require 'httparty'

namespace :waters do
  desc 'Add waters from a text file'
  task :add_waters_from_file do
    text = File.read(Dir.pwd + '/lib/tasks/text_files/shetland_waters.txt')
    waters = NorthernPike.chomp text: text, grid_letters: 'HU'
    waters.each do |water|
      options = {
        body: {
          water: {
            name: water[0],
            description: water[1],
            latitude: water[2][:lat],
            longitude: water[2][:lng],
            water_type_id: 1,
            species_ids: [1]
          }
        },
        headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }
      }

      begin
        response = HTTParty.post('http://lets.fish/api/water/fishery/shetland-anglers-association', options)
        p response unless response.code == 200
        p options
      rescue StandardError => e
        p e
        p options
      end
    end
  end
end
