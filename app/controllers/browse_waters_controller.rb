class BrowseWatersController < ApplicationController
  include Lets

  def all
    @waters = Lets::Waters::all
  end
end
