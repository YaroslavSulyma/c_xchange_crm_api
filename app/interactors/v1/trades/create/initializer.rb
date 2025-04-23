module V1
  module Trades
    module Create
      class Initializer < BaseInteractor
        def call
          context.scope = Current.user.trades
          context.class_validator = V1::Trades::CreateContract
        end
      end
    end
  end
end
