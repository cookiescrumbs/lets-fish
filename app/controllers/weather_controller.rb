class WeatherController < ApplicationController
  respond_to :json

  def forecast
    @weather = WeatherBuilder::build(data: OpenWeatherService::forecast(lat: params[:lat], lng: params[:lng]))
    render 'forecast'
  end

  # params[:timestamp] Unix time, UTC time zone
  def historic
    @weather = WeatherBuilder::build(data: OpenWeatherService::timemachine(lat: params[:lat], lng: params[:lng], timestamp: params[:timestamp]))
    render 'forecast'
  end

end


