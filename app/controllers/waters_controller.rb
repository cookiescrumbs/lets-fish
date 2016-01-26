class WatersController < ApplicationController

  before_action :set_water, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_fishery, only: [:show]
  before_action :set_species, only: [:show]


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
end
