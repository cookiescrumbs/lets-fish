require 'lets'

class SuggestedController < ApplicationController
  respond_to :json

  def all
    @waters = Lets::Waters::all
    @fisheries = Fishery.all_alpha_order
    render 'all'
  end

  def waters
    @waters = Lets::Waters::all
    render 'waters'
  end

  def fisheries
    @fisheries = Fishery.all_alpha_order
    render 'fisheries'
  end
end
