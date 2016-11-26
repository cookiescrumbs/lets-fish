class HomepageController < ApplicationController
  include Homepage

  def index
    @waters = Water.order('id desc').limit(3)
    # fresh_when @waters, public: true
    @fisheries = fisheries_with_waters limit: 3
    # fresh_when @fisheries, public: true
  end

end


