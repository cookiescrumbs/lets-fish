class ImageController < ApplicationController
  respond_to :json

  def attribution
    @attribution = GeographService.user_attribution_from params['id']
    render json: @attribution
  end
end
