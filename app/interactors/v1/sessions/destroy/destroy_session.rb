module V1
  module Sessions
    module Destroy
      class DestroySession < BaseInteractor
        def call
          session = JWTSessions::Session.new(payload: context.input_params[:payload])
          session.flush_by_access_payload
          context.status_code = :ok
        rescue JWTSessions::Errors::Unauthorized, JWTSessions::Errors::InvalidPayload
          context.fail!(errors: [ I18n.t("exception_handler.errors.invalid_auth_token") ], status_code: :unauthorized)
        end
      end
    end
  end
end
