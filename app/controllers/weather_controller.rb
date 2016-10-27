class WeatherController < ApplicationController
  respond_to :json

  def index
    @weather = WeatherBuilder::build(data: DarkSkyService::forecast(lat: params[:lat], lng: params[:lng]))
  end

end