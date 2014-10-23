class Admin::WatersController < ApplicationController

  def index
    @waters = Water.all
  end

end
