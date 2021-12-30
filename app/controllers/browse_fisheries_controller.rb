class BrowseFisheriesController < ApplicationController
  include Lets

  def index
    @fisheries = Fishery.all_alpha_order
  end

end
