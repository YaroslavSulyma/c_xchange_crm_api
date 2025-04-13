module Common
  class DestroyRecord < BaseInteractor
    def call
      context.data.destroy
      context.status_code = :no_content
    rescue ActiveRecord::RecordNotDestroyed => e
      context.fail!(errors: [ e.message ], status_code: :unprocessable_entity)
    end
  end
end
