module Common
  class DestroyCollection < BaseInteractor
    def call
      context.scope.destroy_all
      context.status_code = :no_content
    rescue ActiveRecord::RecordNotDestroyed => e
      context.fail!(errors: [ e.message ], status_code: :unprocessable_entity)
    end
  end
end
