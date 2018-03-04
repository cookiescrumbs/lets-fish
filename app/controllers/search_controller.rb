# frozen_string_literal: true

class SearchController < ApplicationController
  respond_to :json

  before_action :set_water, only: [:index]

  def index
    redirect_to("/#{destination}?location=#{locations[destination]}") if params[:location].nil?
  end

  def within_bounding_box
    waters = Water.where(published: true).includes(:fishery).where('fisheries.published' => true).within_bounding_box(bounds).limit 20 unless bounds.nil?
    @markers = waters
    @results = waters
    render 'search'
  end

  def waters
    fishery_id = Fishery.friendly.find(params[:slug]).id
    waters = Water.where(published: true).includes(:fishery).where('fisheries.published' => true, 'fisheries.id' => fishery_id)
    @markers = waters
    @results = waters
    render 'search'
  end

  private

  def set_water
    @water = Water.where(published: true).includes(:fishery).where('fisheries.published' => true).near(locations[destination]).first unless destination.nil?
  end

  def destination
    params[:destination]
  end

  def locations
    {
      'galloway' => 'Galloway+Forest+Park+Scotland',
      'jura' => 'Isle+of+Jura',
      'shetland' => 'shetland+scotland',
      'snowdonia' => 'blaenau-ffestiniog'
    }
  end

  def bounds
    params[:bounds].split ',' unless params[:bounds].nil?
  end
end
