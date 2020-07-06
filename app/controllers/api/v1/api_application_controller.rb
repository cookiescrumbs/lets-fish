# frozen_string_literal: true

module Api
  module V1
    class ApiApplicationController < ActionController::Base
      # protect_from_forgery with: :null_session

      before_action :destroy_session

      def destroy_session
        request.session_options[:skip] = true
      end
    end
  end
end
