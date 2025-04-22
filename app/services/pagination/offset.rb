module Pagination
  class Offset < BasePaginationService
    attr_reader :scope, :page, :limit

    def initialize(scope:, page: nil, limit: nil)
      @scope = scope
      @page = page&.to_i || Pagy::DEFAULT[:page]
      @limit = limit&.to_i || Pagy::DEFAULT[:limit]
    end

    def call
      pagy, paginated_records = pagy(scope, limit:, page:)

      PaginatedData.new(records: paginated_records, meta: offset_pagination_meta(pagy))
    end

    private

    def offset_pagination_meta(pagy)
      {
        total_count: pagy.count,
        items: pagy.limit,
        max_items: Pagy::DEFAULT[:limit_max],
        self: pagy.page,
        next: pagy.next,
        last: pagy.last,
        prev: pagy.prev
      }
    end
  end
end
