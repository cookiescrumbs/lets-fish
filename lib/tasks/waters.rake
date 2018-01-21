# frozen_string_literal: true

require 'northern_pike'
require 'httparty'

namespace :waters do
  desc 'Add waters from a text file'
  task :add_waters_from_file do
    text = File.read(Dir.pwd + '/lib/tasks/text_files/shetland_waters.txt')
    waters = NorthernPike.chomp text: text, grid_letters: 'HU'
    waters.each do |water|
      p water
      # options = {
      #   body: {
      #     water: {
      #       name: '123',
      #       description: 'second',
      #       lat: 'last thing'
      #     }
      #   }
      # }
      # HTTParty.post('/fishery/waters', options)

    end
  end
end
