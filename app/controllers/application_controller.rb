class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  
  private
      def record_not_found(object)# or exception
          render json: {error: "#{object.model} not found" }, status: :not_found
      end
  
      def record_invalid(object)# or exception
          render json: { errors: object.record.errors.full_messages }, status: :unprocessable_entity
      end
  
  end
