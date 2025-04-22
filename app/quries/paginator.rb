module Paginator
  def offset_pagination(scope, number, items)
    Pagination::Offset.call(scope:, page: number, limit: items)
  end
end
