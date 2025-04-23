module V1
  module Currencies
    module Index
      class Initializer < BaseInteractor
        def call
          context.data = Currency.select(:id, :code, :kind).order(:code)
          context.status_code = :ok
        end
      end
    end
  end
end
