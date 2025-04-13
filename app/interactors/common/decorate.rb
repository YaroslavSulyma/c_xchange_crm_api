module Common
  class Decorate < BaseInteractor
    def call
      context.data = decorate_data
      context.status_code = :ok
    rescue Draper::UninferrableDecoratorError => e
      Rails.logger.error("***DecoratorError: #{e.message}***")
      context.fail!(status_code: :internal_server_error)
    end

    private

    def decorate_data
      if context.data.is_a?(Struct) && context.data.respond_to?(:records)
        context.data.records = context.data.records.decorate
      else
        context.data = context.data.decorate
      end
      context.data
    end
  end
end
