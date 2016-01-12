class HomepageController < ApplicationController
  def index
    @waters = recently_add_waters 3
  end

  private
  def recently_add_waters(number)
    Water.limit(number).order('id desc')
  end
end


