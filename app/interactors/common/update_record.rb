module Common
  class UpdateRecord < BaseInteractor
    def call
      context.data.update!(context.valid_params)
      context.status_code = :ok
    rescue ActiveRecord::StatementInvalid, ActiveRecord::RecordInvalid => e
      context.fail!(errors: [ e.message ], status_code: :unprocessable_entity)
    end
  end
end
