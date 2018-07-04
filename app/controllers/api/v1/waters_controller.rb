# frozen_string_literal: true

module Api
  module V1
    class WatersController < Api::V1::ApiApplicationController
      before_action :set_fishery, only: %i[create]

      def create
        water = @fishery.waters.build(water_params)
        if @fishery.save
          render status: 200, json: {
            message: "Successfully added #{water.name} to #{@fishery.name}",
            water: water
          }.to_json
        else
          render status: 500, json: {
            errors: @fishery.errors
          }.to_json
        end
      end

      private

      def set_fishery
        @fishery = Fishery.find_by(slug: params[:slug])
      end

      def water_params
        params.require(:water).permit(
          :name,
          :description,
          :latitude,
          :longitude,
          :water_type_id,
          species_ids: [],
          :address
        )
      end
    end
  end
end
