module Integrations
  module ByBit
    module P2p
      module Orders
        class PersistTrades < BaseInteractor
          def call
            context.orders.each do |item|
              currency = find_or_create_currency(item[:tokenId])
              fiat_currency = find_or_create_currency(item[:currencyId])

              trade = Current.user.trades.find_or_initialize_by(uid: item[:id])

              if trade.new_record?
                trade.assign_attributes(
                  platform_id: context.platform.id,
                  currency_id: currency.id,
                  fiat_currency_id: fiat_currency.id,
                  direction: item[:side] == 0 ? Trade.directions[:buy] : Trade.directions[:sell],
                  amount: item[:amount].to_d,
                  price: item[:price].to_d,
                  total: (item[:amount].to_d * item[:price].to_d),
                  fee: item[:fee].to_d,
                  traded_at: Time.at(item[:createDate].to_i / 1000).to_datetime,
                  notes: "Bybit P2P Order ID: #{item[:id]}"
                )
                trade.save!
              end
            end
          end

          private

          def find_or_create_currency(code)
            Currency.find_or_create_by!(code: code.to_s.capitalize)
          end
        end
      end
    end
  end
end
