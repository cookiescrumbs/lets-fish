class BrowseWatersController < ApplicationController
  include Lets

  def index
    @waters = Lets::Waters::all
  end
end
