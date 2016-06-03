class HomepageController < ApplicationController
  def index
    @waters = Water.order('id desc').limit(3)
    expires_in 10.minutes
    fresh_when @waters, public: true

    @fisheries = Fishery.order('id desc').limit(3)
    expires_in 10.minutes
    fresh_when @fishery, public: true
  end
end
