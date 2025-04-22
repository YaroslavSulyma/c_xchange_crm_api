module Pagination
  class BasePaginationService < ApplicationService
    include Pagy::Backend

    PaginatedData = Struct.new(:records, :meta, keyword_init: true)
  end
end
