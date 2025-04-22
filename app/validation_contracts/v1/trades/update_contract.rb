module V1
  module Trades
    class UpdateContract < ApplicationContract
      params do
        optional(:platform_id).maybe(:string)
        optional(:currency_id).maybe(:string)
        optional(:fiat_currency_id).maybe(:string)
        optional(:direction).maybe(:string, included_in?: %w[buy sell])
        optional(:amount).maybe(:decimal, gt?: 0)
        optional(:price).maybe(:decimal, gt?: 0)
        optional(:total).maybe(:decimal, gt?: 0)
        optional(:fee).maybe(:decimal, gt?: 0)
        optional(:notes).maybe(:string)
      end
    end
  end
end
