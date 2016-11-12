# http://api.geograph.org.uk/api/photo/158570/[apikey]?output=json
class GeographService
  include HTTParty
  base_uri 'api.geograph.org.uk'
  API_KEY = Rails.application.config.geograph_api_key

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
end
