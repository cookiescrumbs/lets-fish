class StaticController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  
  before_action :authenticate

  def index
    render :layout => false, file: 'public/trips-app/trips.html'
  end

  private

  def authenticate
    trip = Trip.friendly.find(params[:friendly_id])
    if trip.private 
      http_basic_authenticate_or_request_with name:  ENV['TRIPS_USERNAME'],
                                              password: ENV['TRIPS_PASSWORD']
    end
  end
end
