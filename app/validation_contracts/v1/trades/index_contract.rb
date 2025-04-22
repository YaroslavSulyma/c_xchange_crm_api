module V1
  module Trades
    class IndexContract < ApplicationContract
      params do
        optional(:page).hash do
          optional(:number).maybe(:integer, gt?: 0)
          optional(:items).maybe(:integer, gt?: 0, lteq?: Pagy::DEFAULT[:limit_max])
        end
        required(:filter).hash do
          required(:date).filled(:date)
        end
      end
    end
  end
end
