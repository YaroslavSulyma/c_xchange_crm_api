module V1
  class TradesQuery < BaseQuery
    def initialize(params, initial_scope = Current.user.trades)
      @initial_scope = initial_scope
      @number = params.dig(:page, :number)
      @items = params.dig(:page, :items)
      @date = params.dig(:filter, :date) || Date.today
    end

    def call
      filtered_scope = filter_by_attribute(@initial_scope, "traded_at", @date)
      offset_pagination(filtered_scope, @number, @items)
    end
  end
end
