module Integration
  module ByBit
    module V5
      module P2p
        class Orders < Integration::ByBit::Client
          class << self
            def get_orders(from_time: nil, to_time: nil, status: 50, side:, page: 1, size: 30)
              from_time ||= DateTime.current.beginning_of_day.to_time.to_i * 1000
              to_time ||= DateTime.current.end_of_day.to_time.to_i * 1000

              payload = {
                page: page,
                size: size,
                side: side,
                status: status,
                beginTime: from_time,
                endTime: to_time
              }.to_json

              instance.make_request(
                method: :post,
                path: "/v5/p2p/order/simplifyList",
                params: payload,
                headers: { "X-BAPI-SIGN" => Client.gen_signature(payload) }
              )
            end
          end
        end
      end
    end
  end
end
