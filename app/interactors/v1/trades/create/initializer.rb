module V1
  module Trades
    module Create
      class Initializer < BaseInteractor
        def call
          context.scope = Current.user.trades
          const.query_object_class = V1::Trades::IndexQuery
          context.class_validator = V1::Trades::CreateContract
        end
      end
    end
  end
end
