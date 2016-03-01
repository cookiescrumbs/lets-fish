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
      @species = Water.find_by(slug: params[:id]).species
    end

    def set_image_attribution
      binding.pry
      if !geograph_photo_id.nil?
        @image_attribution = GeographService::user_attribution_from geograph_photo_id
      end
    end

    def geograph_photo_id
      first_image.geograph_photo_id unless first_image.nil? || first_image.geograph_photo_id.nil?
    end

    def images
      Water.find_by(slug: params[:id]).images
    end

    def first_image
      images.first unless images.first.nil?
    end

end
