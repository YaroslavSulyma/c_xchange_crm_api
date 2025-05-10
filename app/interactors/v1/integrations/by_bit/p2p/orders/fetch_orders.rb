module Integrations
  module ByBit
    module P2p
      module Orders
        class FetchOrders < BaseInteractor
          PAGE_SIZE = 30

          def call
            from_ms = (context.from_time.to_f * 1000).to_i
            to_ms = (context.to_time.to_f * 1000).to_i
            page = 1

            loop do
              response = Integration::ByBit::V5::P2p::Orders.get_orders(
                from_time: from_ms,
                to_time: to_ms,
                status: 50, # only completed orders
                side: context.order_side_status,
                page: page,
                size: PAGE_SIZE
              )

              unless response.success? && response.body[:ret_code] == 0
                context.fail!(error: "Bybit response error")
              end

              items = response.body.dig(:result, :items)
              break if items.blank?

              context.orders.concat(items)

              break if items.size < PAGE_SIZE
              page += 1
            end
          end
        end
      end
    end
  end
end
