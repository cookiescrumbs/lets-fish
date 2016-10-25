class WeatherController < ApplicationController
  respond_to :json

  def index
    dark_sky_forcast = DarkSkyService::forecast(api_key: api_key, lat: params[:lat], lng: params[:lng])
    @weather = Weather.new(data: dark_sky_forcast)
    @weather.forecast
  end

  private

  def api_key
    Rails.application.config.dark_sky_api_key
  end
end