require_relative '../models/trips'

class TripsController < ApplicationController

  include Trips
    
  def index
    @trips = all
  end
  
end
