class SearchController < ApplicationController
  respond_to :json
  include Lets

  def index
  end

  def within_bounding_box
    waters = Water.includes(:fishery).where('fisheries.published' => true).within_bounding_box(bounds).limit 20 unless bounds.nil?
    @markers = waters
    @results = waters
    render 'search'
  end

  def waters
    fishery_id = Fishery.friendly.find(params[:slug]).id
    waters = Water.where(published: true).includes(:fishery).where('fisheries.published' => true, 'fisheries.id' => fishery_id)
    @markers = waters
    @results = waters
    render 'search'
  end

  def suggested
    @waters = Lets::Waters::all
    @fisheries = Lets::Fisheries::all
    render 'suggested'
  end

  private

  def bounds
    params[:bounds].split ',' unless params[:bounds].nil?
  end

end
