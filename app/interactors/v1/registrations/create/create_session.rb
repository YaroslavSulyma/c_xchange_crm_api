module V1
  module Registrations
    module Create
      class CreateSession < BaseInteractor
        def call
          payload = { user_id: context.data.id }
          session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
          tokens = session.login

          context.data = tokens
          context.status_code = :ok
        end
      end
    end
  end
end
