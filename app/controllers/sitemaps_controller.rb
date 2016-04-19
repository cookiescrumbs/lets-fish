class SitemapsController < ApplicationController
  before_action :set_waters, only: [:index]

  def index
  end

  private
  def set_waters
    @waters = Water.order(name: :asc)
  end

end
