class FisheriesController < ApplicationController

  before_action :set_fishery, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_water, only: [:show]
  before_action :set_image_attribution, only: [:show]
  before_action :set_species, only: [:show]

  def show
  end

  private

  def set_fishery
    @fishery = Fishery.friendly.find(params[:id])
  end

  def set_waters
    @waters = Fishery.friendly.find(params[:id]).waters
  end

  def set_water
    @water = Fishery.friendly.find(params[:id]).waters.first
  end

  #need to get all species form across all waters
  def set_species
    @species = Fishery.friendly.find(params[:id]).waters.first.species.select(:name).distinct
  end

  #Add this stuff to the image model
  def set_image_attribution
    if first_image? && geograph_photo_id?
      @image_attribution = GeographService::user_attribution_from geograph_photo_id, geograph_api_key
    end
  end

  def first_image?
    !@water.images.first.blank?
  end

  def geograph_photo_id
    @water.images.first.geograph_photo_id
  end

  def geograph_api_key
    return Rails.application.config.geograph_api_key
  end

  def geograph_photo_id?
    !@water.images.first.geograph_photo_id.blank?
  end

end
