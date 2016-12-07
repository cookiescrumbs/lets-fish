class WeatherController < ApplicationController

  def forecast
    @weather = WeatherBuilder::build(data: DarkSkyService::forecast(lat: params[:lat], lng: params[:lng]))

    respond_to do |format|
      format.html  { render layout: 'component' }
      format.json {}
    end

  end

end
