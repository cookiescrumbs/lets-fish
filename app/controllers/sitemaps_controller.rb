class SitemapsController < ApplicationController
  include Lets
  before_action :set_waters, only: [:index]
  before_action :set_fisheries, only: [:index]

  def index
  end

  private

  def set_waters
    @waters = Lets::Waters::all
    # fresh_when @waters, public: true
  end

  def set_fisheries
    @fisheries = Fishery.all_alpha_order
    # fresh_when @fisheries, public: true
  end
end

