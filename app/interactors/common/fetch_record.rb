module Common
  class FetchRecord < BaseInteractor
    def call
      data = context.scope.find_by(id: context.record_id)
      if data.present?
        context.data = data
        context.status_code = :ok
      else
        context.fail!(
          errors: [ I18n.t("exception_handler.errors.record_not_found", id: context.record_id) ], status_code: :not_found
        )
      end
    end
  end
end
