require 'Lets'

class FisheriesController < ApplicationController


  before_action :set_fishery, only: [:show]
  before_action :set_waters, only: [:show]
  before_action :set_water, only: [:show]
  before_action :set_species, only: [:show]
  before_action :set_water_types, only: [:show]
  before_action :set_meta, only: [:show]

  def show; end

  private

  def set_fishery
    @fishery = Fishery.friendly.find(params[:id])
    # fresh_when @fishery, public: true
  end

  def set_waters
    @waters = Fishery.friendly.find(params[:id]).waters
  end

  def set_water
    fishery_slug = params[:id]
    @water = Lets::Waters.random_from fishery_slug
  end

  # need to get all species from across all waters ["brown trout", "salmon", "sea trout"]
  def set_species
    @species = Fishery.friendly.find(params[:id]).species
  end

  # need to get all the water types from across all waters ["lake", "river"]
  def set_water_types
    @water_types = Fishery.friendly.find(params[:id]).water_types
  end


  def set_meta
    fishery = Fishery.friendly.find(params[:id])
    set_meta_tags title: fishery.meta_title
    set_meta_tags description: fishery.meta_description
    set_meta_tags fishery.open_graph fishery_url fishery
    set_meta_tags fishery.twitter
  end
end
