class SitemapsController < ApplicationController
  before_action :set_waters, only: [:index]
  before_action :set_fisheries, only: [:index]

  def index
  end

  private

  def set_waters
    @waters = Water.order(name: :asc)
    # fresh_when @waters, public: true
  end

  def set_fisheries
    @fisheries = Fishery.order(name: :asc)
    # fresh_when @fisheries, public: true
  end
end
