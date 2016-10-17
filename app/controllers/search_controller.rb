class SearchController < ApplicationController
  respond_to :html, :json

  def index
    @waters = Water.within_bounding_box(bounds).limit 20 unless bounds.nil?
    expires_in 1.day
    fresh_when @waters, public: true
  end

  private

  def bounds
    if params[:bounds]
      params[:bounds].split ','
    else
      calculate_bounds
    end
  end

  def calculate_bounds
    Geocoder::Calculations.bounding_box(center_point, 40) unless center_point.nil?
  end

  def center_point
    center_point_from_lat_lng || center_point_from_location
  end

  def center_point_from_lat_lng
    [params[:lat], params[:lng]] unless params[:lat].nil? || params[:lng].nil?
  end

  def center_point_from_location
    Geocoder.coordinates(params[:location]) unless params[:location].nil?
  end
end
