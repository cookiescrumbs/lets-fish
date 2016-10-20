class HomepageController < ApplicationController
  def index
    @waters = Water.order('id desc').limit(3)
    fresh_when @waters, public: true

    @fisheries = Fishery.order('id desc').limit(3)
    fresh_when @fisheries, public: true
  end
end