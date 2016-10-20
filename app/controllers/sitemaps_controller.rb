class SitemapsController < ApplicationController
  before_action :set_waters, only: [:index]
  before_action :set_fisheries, only: [:index]

  def index
  end

  private

  def set_waters
    @waters = Water.order(name: :asc)
    expires_in 1.day
    fresh_when last_modified: @waters.maximum(:updated_at), public: true
  end

  def set_fisheries
    @fisheries = Fishery.order(name: :asc)
    expires_in 1.day
    fresh_when last_modified: @fisheries.maximum(:updated_at), public: true
  end
end
