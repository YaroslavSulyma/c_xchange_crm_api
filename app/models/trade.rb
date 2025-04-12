class Trade < ApplicationRecord
  enum :direction, [ :buy, :sell ]

  belongs_to :user
  belongs_to :platform
  belongs_to :currency
  belongs_to :fiat_currency, class_name: "Currency"
end
