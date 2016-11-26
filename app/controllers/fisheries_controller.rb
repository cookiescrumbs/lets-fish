class FisheriesController < ApplicationController
  before_action :set_fishery, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_water, only: [:show]
  before_action :set_image_attribution, only: [:show]
  before_action :set_species, only: [:show]
  before_action :set_water_types, only: [:show]
  before_action :set_meta, only: [:show]

  def show
  end

  private

  def set_fishery
    @fishery = Fishery.friendly.find(params[:id])
    # fresh_when @fishery, public: true
  end

  def set_waters
    @waters = Fishery.friendly.find(params[:id]).waters
  end

  def set_water
    redirect_to '/' unless Fishery.friendly.find(params[:id]).waters.first
    @water = Fishery.friendly.find(params[:id]).waters.first
  end

  # need to get all species from across all waters ["brown trout", "salmon", "sea trout"]
  def set_species
    @species = Fishery.friendly.find(params[:id]).species
  end

  # need to get all the water types from across all waters ["lake", "river"]
  def set_water_types
    @water_types = Fishery.friendly.find(params[:id]).water_types
  end

  # Add this stuff to the image model
  def set_image_attribution
    return unless first_image? && geograph_photo_id?
    @image_attribution = GeographService.user_attribution_from geograph_photo_id
  end

  def first_image?
    if @water.nil?
      return false
    end
    !@water.images.first.blank?
  end

  def geograph_photo_id
    @water.images.first.geograph_photo_id
  end

  def geograph_photo_id?
    !@water.images.first.geograph_photo_id.blank?
  end

  def set_meta
    fishery = Fishery.friendly.find(params[:id])
    set_meta_tags title: fishery.meta_title
    set_meta_tags description: fishery.meta_description
  end
end
