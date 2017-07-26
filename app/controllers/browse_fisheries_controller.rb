class BrowseFisheriesController < ApplicationController
  include Lets

  def index
    @fisheries = Lets::Fisheries::all
  end

end
