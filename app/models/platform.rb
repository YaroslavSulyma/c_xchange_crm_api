class Platform < ApplicationRecord
  has_many :trades, dependent: :nullify
end
