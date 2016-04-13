class WatersController < ApplicationController

  before_action :set_water, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_fishery, only: [:show]
  before_action :set_species, only: [:show]
  before_action :set_image_attribution, only: [:show]

  def show
  end

  private
    def set_water
      @water = Water.find_by(slug: params[:id])
    end

    def set_waters
      @waters = Water.find_by(slug: params[:id]).fishery.waters
    end

    def set_fishery
      @fishery = Water.find_by(slug: params[:id]).fishery
    end

    def set_species
      @species = Water.find_by(slug: params[:id]).species.select(:name).distinct
    end

    def set_image_attribution
      if first_image? && geograph_photo_id?
        @image_attribution = GeographService::user_attribution_from geograph_photo_id, geograph_api_key
      end
    end

    def first_image?
      !Water.find_by(slug: params[:id]).images.first.nil?
    end

    def geograph_photo_id
      Water.find_by(slug: params[:id]).images.first.geograph_photo_id
    end

    def geograph_api_key
      return Rails.application.config.geograph_api_key
    end

    def geograph_photo_id?
      !Water.find_by(slug: params[:id]).images.first.geograph_photo_id.nil?
    end



end
