class SearchController < ApplicationController

  def index
    @waters = Water.within_bounding_box(bounds) unless bounds.nil?
  end

  private

  def bounds
    Geocoder::Calculations.bounding_box(center_point, 20) unless center_point.nil?
  end

  def center_point
    center_point_from_url || center_point_from_location
  end

  def center_point_from_url
    [params[:lat],params[:lng]] unless params[:lat].nil? || params[:lng].nil?
  end

  def center_point_from_location
    Geocoder.coordinates(params[:location]) unless params[:location].nil?
  end

end
