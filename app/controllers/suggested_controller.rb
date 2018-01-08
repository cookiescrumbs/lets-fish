class SuggestedController < ApplicationController
  respond_to :json
  include Lets

  def all
    @waters = Lets::Waters::all
    @fisheries = Lets::Fisheries::all
    render 'all'
  end
end
