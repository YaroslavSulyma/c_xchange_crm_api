module V1
  module Trades
    module Update
      class Initializer < BaseInteractor
        def call
          context.scope = Current.user.trades
          context.class_validator = V1::Trades::UpdateContract
        end
      end
    end
  end
end
