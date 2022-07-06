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
      <p class=\"title\"><strong>Distance, time and mode of travel</p></strong>
      <p><mark>#{destination.distance}</mark></p>
      <p><mark>#{destination.time_and_mode}</mark></p>
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
