class SearchController < ApplicationController

  skip_before_action :verify_authenticity_token
  respond_to :html, :json

  def index
    @waters = Water.within_bounding_box(bounds) unless bounds.nil?
    respond_with(@waters)
  end

  private

  def bounds
    if !params[:bounds].nil?
      params[:bounds]
    else
      calculate_bounds
    end
  end

  def calculate_bounds
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

  def within_bounding_box
    @waters = Water.within_bounding_box(bounds)
  end

end
