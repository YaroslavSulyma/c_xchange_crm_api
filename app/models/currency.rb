class Currency < ApplicationRecord
  enum :kind, [ :crypto, :fiat ]

  has_many :trades, dependent: :restrict_with_error
  has_many :fiat_trades, class_name: "Trade", foreign_key: "fiat_currency_id", dependent: :restrict_with_error
end
