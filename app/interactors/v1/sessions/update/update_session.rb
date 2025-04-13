module V1
  module Sessions
    module Update
      class UpdateSession < BaseInteractor
        def call
          session = JWTSessions::Session.new(payload: context.input_params[:claimless_payload], refresh_by_access_allowed: true)
          tokens = session.refresh_by_access_payload
          context.data = tokens
          context.status_code = :ok
        rescue JWTSessions::Errors::Unauthorized
          context.fail!(errors: [ I18n.t("exception_handler.errors.invalid_refresh_token") ], status_code: :unauthorized)
        end
      end
    end
  end
end
