class HomepageController < ApplicationController

  def index
    @waters = recently_add_waters 3
    @fisheries = recently_add_fisheries 3
  end

  private

  def recently_add_waters(number)
    Water.limit(number).order('id desc')
  end

  def recently_add_fisheries(number)
    Fishery.limit(number).order('id desc')
  end

end


