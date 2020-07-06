class WeatherController < ApplicationController
  respond_to :json

  def forecast
    @weather = WeatherBuilder::build(data: DarkSkyService::forecast(lat: params[:lat], lng: params[:lng]))
    render 'forecast'
  end

end
