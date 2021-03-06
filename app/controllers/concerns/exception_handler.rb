module ExceptionHandler extend ActiveSupport::Concern
  
    # Define custom error subclasses - rescue catches `StandardErrors`
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end
    class ParameterInvalid < StandardError; end
  
    included do
      # Define custom handlers
      rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
      rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
      rescue_from StandardError::ArgumentError, with: :bad_request
      rescue_from ExceptionHandler::MissingToken, with: :unauthorized_request
      rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
      rescue_from ExceptionHandler::ParameterInvalid, with: :four_twenty_two
      rescue_from ActionController::RoutingError ,with: :not_found
    end
  
    private
  
    # JSON response with message; Status code 422 - unprocessable entity
    def four_twenty_two(e)
      json_response({ message: e.message }, :unprocessable_entity)
    end
  
    # JSON response with message; Status code 401 - Unauthorized
    def unauthorized_request(e)
      json_response({ message: e.message }, :unauthorized)
    end

    def not_found(e)
      json_response({ message: e.message }, :not_found)
    end

    def bad_request(e)
      json_response({ message: e.message , errors: e  }, :bad_request)
    end
  end