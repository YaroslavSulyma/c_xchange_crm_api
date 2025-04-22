module V1
  class AuthorizedController < ApplicationController
    before_action :set_user

    private

    def set_user
      authorize_by_access_header!
      user = User.find_by(id: payload["user_id"])
      raise JWTSessions::Errors::Unauthorized if user.nil?

      Current.user ||= user
    end
  end
end
