require 'trip-planner/destination'
require 'trip-planner/distance'

class DestinationController < ApplicationController

  def distance
    api_key = Rails.application.config.google_api_key_browser
    distance = TripPlanner::Distance.new(
      start: start,
      finish: finish,
      http: HTTParty,
      api_key: api_key
    )
    destination = TripPlanner::Destination.new(distance: distance)
    render html: "
      <h3>#{destination.distance}</h3>
      <h3>#{destination.time_and_mode}</h3>
    ".html_safe
  end

  private

  def start
    params['start']
  end

  def finish
    params['finish']
  end
end
