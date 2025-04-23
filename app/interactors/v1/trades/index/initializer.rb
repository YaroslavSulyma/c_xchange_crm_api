module V1
  module Trades
    module Index
      class Initializer < BaseInteractor
        def call
          context.scope = Current.user.trades
          context.query_object_class = V1::TradesQuery
          context.class_validator = V1::Trades::IndexContract
        end
      end
    end
  end
end
