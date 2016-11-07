class PlacesController < ApplicationController
  respond_to :json

  def index
    google_places = GooglePlaces::Client.new(api_key)
    @places = google_places.spots(lat,lng, types: ['lodging', 'campground'], radius: ten_miles)
  end

  private

  def api_key
    Rails.application.config.google_api_key
  end

  def lat
    params[:lat].to_f || nil
  end

  def lng
    params[:lng].to_f || nil
  end

  def ten_miles
    17000
  end

end