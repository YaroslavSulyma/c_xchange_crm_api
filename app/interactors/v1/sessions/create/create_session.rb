module V1
  module Sessions
    module Create
      class CreateSession < BaseInteractor
        def call
          user = User.find_by(email: context.valid_params[:email])

          if user&.authenticate(context.valid_params[:password])
            payload = { user_id: user.id }
            session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
            tokens = session.login
            context.data = tokens
            context.status_code = :ok
          else
            context.fail!(errors: [ I18n.t("exception_handler.errors.invalid_email_or_password") ], status_code: :unauthorized)
          end
        end
      end
    end
  end
end
