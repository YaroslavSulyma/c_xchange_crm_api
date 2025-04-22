module V1
  module Trades
    module Destroy
      class Initializer < BaseInteractor
        def call
          context.scope = Current.user.trades
        end
      end
    end
  end
end
