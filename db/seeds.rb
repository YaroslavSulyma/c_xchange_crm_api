# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
%w[Binance Bybit Whitebit OKX Gate.io BingX].each do |name|
  Platform.find_or_create_by!(name: name)
end

[
  { code: "USD", kind: :fiat },
  { code: "EUR", kind: :fiat },
  { code: "UAH", kind: :fiat },
  { code: "BTC", kind: :crypto },
  { code: "ETH", kind: :crypto },
  { code: "USDT", kind: :crypto }
].each do |data|
  Currency.find_or_create_by!(code: data[:code], kind: data[:kind])
end
