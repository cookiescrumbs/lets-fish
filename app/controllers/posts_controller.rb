class PostsController < ApplicationController
  before_action :set_trip, only: [:index]
  
  # all posts for a trip
  def index
    render 'post'
    respond_to :json
  end

  private

  def set_trip
    @posts = Trip.find(params[:trip_id]).posts
  end
end
