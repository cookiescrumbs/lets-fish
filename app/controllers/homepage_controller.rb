class HomepageController < ApplicationController
  def index
    @waters = Water.order('id desc').limit(3)
    expires_in 10.minutes
    fresh_when last_modified: @waters.maximum(:updated_at), public: true

    @fisheries = Fishery.order('id desc').limit(3)
    expires_in 10.minutes
    fresh_when last_modified: @fisheries.maximum(:updated_at), public: true
  end
end