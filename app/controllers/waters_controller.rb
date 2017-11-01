class WatersController < ApplicationController
  include Lets
  before_action :set_water, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_fishery, only: [:show]
  before_action :set_species, only: [:show]
  before_action :set_meta, only: [:show]

  def show
  end

  def all
    @waters = Lets::Waters::all
  end

  private

  def set_water
    @water = Water.friendly.find(params[:id])
    # fresh_when @water, public: true
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

  def set_meta
    water = Water.friendly.find(params[:id])
    set_meta_tags title: water.meta_title
    set_meta_tags description: water.meta_description
    set_meta_tags water.open_graph fishery_water_url water.fishery, water
    set_meta_tags water.twitter

    set_meta_tags amphtml: water.amp_html(fishery_water_url(water.fishery, water)) unless request.format == :amp
  end
end
