# frozen_string_literal: true

class API
  class V1
    class WatersController < Api::V1::ApiApplicationController
      def create
        @water = @fishery.waters.build(water_params)
        if @fishery.save

        else
          render action: 'new'
        end
      end

      private

      def water_params
        params.require(:water).permit(
          :name,
          :description,
          :latitude,
          :longitude,
          :water_type_id,
          species_ids: []
        )
      end
    end
  end
end

