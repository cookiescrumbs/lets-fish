class WatersController < ApplicationController
  before_action :set_water, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_fishery, only: [:show]
  before_action :set_species, only: [:show]
  before_action :set_image_attribution, only: [:show]
  before_action :set_meta, only: [:show]

  def show
  end

  private

  def set_water
    @water = Water.friendly.find(params[:id])
    expires_in 1.day
    fresh_when @water, public: true
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

  # add this stuff to the image model
  def set_image_attribution
    return unless first_image? && geograph_photo_id?
    @image_attribution = GeographService.user_attribution_from geograph_photo_id, geograph_api_key
  end

  def first_image?
    !Water.friendly.find(params[:id]).images.first.nil?
  end

  def geograph_photo_id
    Water.friendly.find(params[:id]).images.first.geograph_photo_id
  end

  def geograph_api_key
    Rails.application.config.geograph_api_key
  end

  def geograph_photo_id?
    !Water.friendly.find(params[:id]).images.first.geograph_photo_id.nil?
  end

  def set_meta
    water = Water.friendly.find(params[:id])
    page_title "Fly fishing at #{water.name.strip}, #{water.short_address}"
    built_description = build_meta_description(
      name: water.name,
      address: water.short_address,
      description: water.description
    )
    meta_description built_description
  end

  def page_title(title)
    set_meta_tags title: title
  end

  def meta_description(description)
    set_meta_tags description: description
  end

  def build_meta_description(name: nil, address: nil, description: nil)
    built_description = "Fly fishing at #{name}, #{address}."
    return built_description if description.blank?
    "#{built_description} #{description}"
  end
end
