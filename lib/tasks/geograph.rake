# frozen_string_literal: true

require Dir.pwd + '/app/services/geograph_service'

namespace :geograph do
  desc 'Download and save photos using a txt file of locations'
  task :download_photos do
    text = File.read(Dir.pwd + '/lib/tasks/text_files/shetland_images.txt')
    text.split("\n").each_slice(3).to_a.each do |a|
      loch_name = a[0]
      loch_location = "HU#{a[1].tr(' ', '')}"
      folder_name = "#{loch_name.tr(' ', '-').downcase}-#{loch_location}"
      FileUtils.mkpath Dir.pwd + "/lib/tasks/water_images/#{folder_name}"
      [*0..3].each do |n|
        photo_info = GeographService.photo_by_location location: loch_location, position: n
        break if photo_info.nil?
        file_name = "#{photo_info['title'].split(':')[1].strip.tr(' ', '-').downcase}-#{photo_info['file_name']}"
        IO.copy_stream((open(photo_info['download']) unless photo_info.empty?), Dir.pwd + "/lib/tasks/water_images/#{folder_name}/#{file_name}.jpg")
      end
    end
  end
end

