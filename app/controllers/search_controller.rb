class SearchController < ApplicationController
  respond_to :json

  def index
  end

  def within_bounding_box
    waters = Water.within_bounding_box(bounds).limit 20 unless bounds.nil?
    @markers = waters
    @results = waters
    render 'search'
  end

  private

  def bounds
    params[:bounds].split ',' unless params[:bounds].nil?
  end

end
