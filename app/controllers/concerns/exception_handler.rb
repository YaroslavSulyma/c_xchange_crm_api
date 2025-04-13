module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from Interactor::Failure, with: :handle_interactor_error
    rescue_from JWTSessions::Errors::Unauthorized, with: :handle_authentication_error
  end

  private

  def handle_interactor_error(interactor_error)
    context = interactor_error.context
    formatted_errors = format_interactor_errors(context)
    render json: { errors: formatted_errors }, status: context.status_code
  end

  def handle_authentication_error(error)
    render json: { errors: [ format_authentication_error(error) ] }, status: :unauthorized
  end

  def format_interactor_errors(interactor_error)
    case interactor_error.status_code
    when :unprocessable_entity
      interactor_error.errors.map { |error| format_validation_error(error) }
    when :not_found
      interactor_error.errors.map { |error| format_not_found_error(error) }
    when :unauthorized
      interactor_error.errors.map { |error| format_authentication_error(error) }
    else
      [ format_server_error ]
    end
  end

  def format_authentication_error(error)
    detail = error.is_a?(String) ? error : error.message
    { title: I18n.t("exception_handler.errors.auth_error"), detail: }
  end

  def format_validation_error(error)
    detail = error.is_a?(String) ? error : error.text
    {
      source: error.respond_to?(:path) ? { pointer: error.path.join("/") } : nil,
      title: I18n.t("exception_handler.errors.validation_error"),
      detail:
    }
  end

  def format_not_found_error(message)
    {
      title: I18n.t("exception_handler.errors.not_persisted"),
      detail: message
    }
  end

  def format_server_error
    {
      title: I18n.t("exception_handler.errors.server_error.title"),
      detail: I18n.t("exception_handler.errors.server_error.detail")
    }
  end
end
