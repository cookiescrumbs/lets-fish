class BrowseFisheriesController < ApplicationController
  include Lets

  def all
    @fisheries = Lets::Fisheries::all
  end

end
