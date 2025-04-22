module V1
  module Trades
    module Index
      class Initializer < BaseInteractor
        def call
          context.scope = Current.user.trades
          context.class_validator = V1::Trades::IndexContract
        end
      end
    end
  end
end
