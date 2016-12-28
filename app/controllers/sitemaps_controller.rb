class SitemapsController < ApplicationController
  before_action :set_waters, only: [:index]
  before_action :set_fisheries, only: [:index]

  def index
  end

  private

  def set_waters
    @waters =  Water.includes(:fishery).where('fisheries.published' => true).order(name: :asc)
    # fresh_when @waters, public: true
  end

  def set_fisheries
    @fisheries = Fishery.where(published: true).includes(:waters).where.not('waters.id' => nil).order(name: :asc)
    # fresh_when @fisheries, public: true
  end
end
