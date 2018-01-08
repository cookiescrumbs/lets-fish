class SuggestedController < ApplicationController
  respond_to :json
  include Lets

  def all
    @waters = Lets::Waters::all
    @fisheries = Lets::Fisheries::all
    render 'all'
  end

  def waters
    @waters = Lets::Waters::all
    render 'waters'
  end

  def fisheries
    @fisheries = Lets::Fisheries::all
    render 'fisheries'
  end
end
