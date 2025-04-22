class BaseQuery
  include Filterable
  include Searchable
  include Paginator

  DEFAULT_DIRECTION = "ASC".freeze
  ALLOWED_DIRECTIONS = %w[ASC DESC].freeze

  def call
    raise NotImplementedError, "You should implement this method in a child class."
  end

  private

  def ordered(scope, field, direction = DEFAULT_DIRECTION)
    return scope unless field && direction && allowed_direction?(direction)

    scope.order("#{field} #{direction}")
  end

  def allowed_direction?(direction)
    ALLOWED_DIRECTIONS.include? direction&.upcase
  end
end
