class Currency < ApplicationRecord
  enum :kind, [:crypto, :fiat]
end
