class StaticController < ApplicationController
  def index
    render :layout => false, file: 'public/trips-app/trips.html'
  end
end
