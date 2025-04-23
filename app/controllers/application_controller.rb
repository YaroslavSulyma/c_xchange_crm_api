class ApplicationController < ActionController::API
  include ExceptionHandler
  include JWTSessions::RailsAuthorization
end
