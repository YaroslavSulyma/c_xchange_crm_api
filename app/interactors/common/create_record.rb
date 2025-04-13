module Common
  class CreateRecord < BaseInteractor
    def call
      data = context.scope.create(context.valid_params)
      if (data.is_a?(Array) && data.all?(&:persisted?)) || data.persisted?
        context.data = data
        context.status_code = :created
      else
        context.fail!(errors: [ I18n.t("exception_handler.errors.not_persisted") ], status_code: :unprocessable_entity)
      end
    end
  end
end
