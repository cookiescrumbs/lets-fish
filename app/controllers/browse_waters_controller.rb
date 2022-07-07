require 'lets'

class BrowseWatersController < ApplicationController
  def index
    @waters = Lets::Waters::all
  end
end
