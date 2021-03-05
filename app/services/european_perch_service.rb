module EuropeanPerchService
  include HTTParty
  base_uri 'https://still-waters-39747.herokuapp.com'

  def self.get_OS_map(lat:, lng:)
    begin
      response = get("/api/v1/lat/#{lat}/lng/#{lng}", timeout: 1)
      return {} unless response.code === 200
      response
    rescue
      {}
    end 
  end

end
