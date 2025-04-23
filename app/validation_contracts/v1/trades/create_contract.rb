module V1
  module Trades
    class CreateContract < ApplicationContract
      params do
        required(:platform_id).filled(:string)
        required(:currency_id).filled(:string)
        required(:fiat_currency_id).filled(:string)
        required(:direction).filled(:string, included_in?: %w[buy sell])
        required(:amount).filled(:decimal, gt?: 0)
        required(:price).filled(:decimal, gt?: 0)
        required(:total).filled(:decimal, gt?: 0)
        required(:fee).filled(:decimal, gteq?: 0)
        optional(:notes).maybe(:string)
      end
    end
  end
end
