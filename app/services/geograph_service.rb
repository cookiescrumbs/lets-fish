# http://api.geograph.org.uk/api/photo/158570/[apikey]?output=json
class GeographService
  include HTTParty
  base_uri 'api.geograph.org.uk'
  API_KEY = ENV['GEOGRAPH_API_KEY'] || Rails.application.config.geograph_api_key

  def self.user_attribution_from(photo_id)
    begin
      response = get("/api/photo/#{photo_id}?key=#{GeographService::API_KEY}&output=json", timeout: 1)
      return {} unless response.code === 200
      {
        name: response['realname'],
        profile_url: 'http://www.geograph.org.uk' + response['profile_link'],
        photo_url: "http://www.geograph.org.uk/photo/#{photo_id}",
        licence: 'http://creativecommons.org/licenses/by-sa/2.0/'
      }
    rescue
      {}
    end
  end

  def self.photo_by_location(location:, position: 0)
    response = get("/syndicator.php?key=#{GeographService::API_KEY}&format=JSON&location=#{location}")
    return {} unless response.code === 200
    info = {}
    if response['items'].empty?
      puts "#{location} Returned empty!"
      return nil
    end
    item = response['items'][position]
    photo_and_download_ids = item['thumb'].split('/').last.split('_')
    photo_id = photo_and_download_ids[0]
    download_id = photo_and_download_ids[1]
    info['download'] = "http://www.geograph.org.uk/reuse.php?id=#{photo_id}&download=#{download_id}"
    info['author'] = item['author']
    info['id'] = item['guid']
    info['title'] = item['title']
    info['file_name'] = "geograph-#{info['id']}-by-#{info['author'].tr(' ','-')}"
    info['sizes'] = %w[original 1024 800 640]
    info
  end
end
