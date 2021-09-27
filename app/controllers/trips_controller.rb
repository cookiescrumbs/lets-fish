class TripsController < ApplicationController
  before_action :set_trip, only: [:show]
  
  # all trips
  def index
    @trips = Lets::Trips::private_all false
  end

  # show one trip
  def show
    render 'trip'
    respond_to :json
  end

  private

  def set_trip
    @trip = Trip.friendly.find(params[:id])
  end
end
