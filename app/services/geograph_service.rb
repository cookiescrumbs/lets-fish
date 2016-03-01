#http://api.geograph.org.uk/api/photo/158570/[apikey]?output=json
class GeographService
    include HTTParty
    base_uri 'api.geograph.org.uk'

    def self.user_attribution_from(photo_id:)
      response = get("/api/photo/#{photo_id}?output=json")
      {
        name: response['realname'],
        profile_url: 'http://www.geograph.org.uk/' + response['profile_link'],
        licence: 'http://creativecommons.org/licenses/by-sa/2.0/'
      }
    end
end
