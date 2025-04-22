module Searchable
  private

  def search(scope, attribute, value)
    return scope if attribute.blank? || value.blank?

    scope.where(scope.arel_table[attribute].matches("%#{value}%"))
  end
end
