class StaticController < Rails::ApplicationController
  def index
    render :layout => false, file: 'public/trips.html'
  end
end
