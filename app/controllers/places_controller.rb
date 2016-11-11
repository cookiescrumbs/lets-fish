class PlacesController < ApplicationController
  include MapMarkers

  respond_to :json

  def index
    @markers = MapMarkers::Places::build(places)
  end

  def info_window
    @info_window = MapInfoWindow::Places::build(place)
  end

  private

  def places
    GooglePlacesService::places(lat: lat, lng: lng)
  end

  def place
    GooglePlacesService::place(id)
  end

  def lat
    params[:lat].to_f
  end

  def lng
    params[:lng].to_f
  end

  def id
    params[:id]
  end

end