class WatersController < ApplicationController

  before_action :set_water, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_fishery, only: [:show]
  before_action :set_species, only: [:show]
  before_action :set_image_attribution, only: [:show]
  before_action :set_meta_tags, only: [:show]

  def show
  end

  private

  def set_water
    @water = Water.friendly.find(params[:id])
    expires_in 1.day
    fresh_when @water
  end

  def set_waters
    @waters = Water.friendly.find(params[:id]).fishery.waters
  end

  def set_fishery
    @fishery = Water.friendly.find(params[:id]).fishery
  end

  def set_species
    @species = Water.friendly.find(params[:id]).species.select(:name).distinct
  end

  #add this stuff to the image model
  def set_image_attribution
    if first_image? && geograph_photo_id?
      @image_attribution = GeographService::user_attribution_from geograph_photo_id, geograph_api_key
    end
  end

  def first_image?
    !Water.friendly.find(params[:id]).images.first.nil?
  end

  def geograph_photo_id
    Water.friendly.find(params[:id]).images.first.geograph_photo_id
  end

  def geograph_api_key
    return Rails.application.config.geograph_api_key
  end

  def geograph_photo_id?
    !Water.friendly.find(params[:id]).images.first.geograph_photo_id.nil?
  end

  def set_meta_tags
    water = Water.friendly.find(params[:id])
    PageConfiguration::SetMetaTag::title title: "Fly fishing at #{water.name.strip}, #{water.short_address}"
    PageConfiguration::SetMetaTag::description(
      short: "Fly fishing at #{water.name.strip}, #{water.short_address}.",
      full: water.description
    )
  end

end
