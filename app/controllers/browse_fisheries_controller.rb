require 'lets'

class BrowseFisheriesController < ApplicationController
  def index
    @fisheries = Fishery.all_alpha_order
  end

end
