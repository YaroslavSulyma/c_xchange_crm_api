module Common
  class FetchCollection < BaseInteractor
    def call
      context.data = fetch_data
      context.status_code = :ok
    end

    private

    def fetch_data
      context.query_object_class.new(*query_object_params).call
    end

    def query_object_params
      context.valid_params ||= {}
      [ context.valid_params, context.initial_scope ].compact
    end
  end
end
