class PlacesController < ApplicationController
  include MapMarkers

  respond_to :json

  def index
    @markers = MapMarkers::Places::build(places)
  end

  private

  def places
    GooglePlacesService::places(lat: lat, lng: lng)
  end

  def lat
    params[:lat].to_f
  end

  def lng
    params[:lng].to_f
  end

end