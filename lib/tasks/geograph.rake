# frozen_string_literal: true

require Dir.pwd + '/app/services/geograph_service'

namespace :geograph do
  desc 'Download and save photos using a txt file of locations'
  task :download_photos_from_txt_file do
    text = File.read(Dir.pwd + '/lib/tasks/text_files/shetland_images.txt')
    text.split("\n").each_slice(3).to_a.each do |a|
      loch_name = a[0]
      loch_location = "HU#{a[1].tr(' ', '')}"
      folder_name = "#{loch_name.tr(' ', '-').downcase}-#{loch_location}"
      FileUtils.mkpath Dir.pwd + "/lib/tasks/water_images/#{folder_name}"
      [*0..3].each do |n|
        photo_info = GeographService.photo_by_location location: loch_location, position: n
        break if photo_info.nil?
        %w[small original].each do |photo_size|
          file_name = "#{photo_info['title'].split(':')[1].strip.tr(' ', '-').downcase}-#{photo_info['file_name']}-#{photo_size}"
          open_file_from_url = photo_size == 'small' ? photo_info['download'] : "#{photo_info['download']}&size=original"
          IO.copy_stream((open(open_file_from_url) unless photo_info.empty?), Dir.pwd + "/lib/tasks/water_images/#{folder_name}/#{file_name}.jpg")
        end
      end
    end
  end

  desc 'Download and save photos using a json file of locations'
  task :download_photos_from_json_file do
    fishery = 'forsinard-fly-fishers'
    waters = JSON.parse(File.read(Dir.pwd + "/lib/tasks/json_files/#{fishery}.json"))
    waters.each do |water|
      folder_name = water['name'].first.tr(' ', '-')
      loch_location = water['lat_lng'].strip
      FileUtils.mkpath Dir.pwd + "/lib/tasks/water_images/#{fishery}/#{folder_name}"
      [*0..3].each do |n|
        photo_info = GeographService.photo_by_location location: loch_location, position: n
        break if photo_info.nil?
        %w[small original].each do |photo_size|
          file_name = "#{photo_info['title'].split(':')[1].strip.tr(' ', '-').downcase}-#{photo_info['file_name']}-#{photo_size}"
          open_file_from_url = photo_size == 'small' ? photo_info['download'] : "#{photo_info['download']}&size=original"
          IO.copy_stream((open(open_file_from_url) unless photo_info.empty?), Dir.pwd + "/lib/tasks/water_images/#{fishery}/#{folder_name}/#{file_name}.jpg")
        end
      end
    end
  end
end
