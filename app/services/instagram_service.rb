# https://api.instagram.com/v1/tags/fishingloch/media/recent?access_token=245561560.e029fea.953a89e625e5438494f446f5990ccf5e
class InstagramService
  include HTTParty
  base_uri 'https://api.instagram.com/v1'
  API_KEY = Rails.application.config.instagram_api_key

  def self.photos_from_tag(tag)
    begin
      response = get("/tags/#{media}/recent#{photo_id}?access_token=#{InstagramService::API_KEY}", timeout: 1)
      return {} unless response.code === 200
    rescue
      {}
    end
  end
end
