module Integrations
  module ByBit
    module P2p
      module Orders
        class Initialization < BaseInteractor
          def call
            context.platform = Platform.find_or_create_by!(name: "Bybit")

            context.from_time ||= DateTime.current.beginning_of_day
            context.to_time ||= DateTime.current.end_of_day
            context.order_side_status = context.side_status == :buy ? 0 : 1
            context.orders = []
          end
        end
      end
    end
  end
end
