module Filterable
  private

  def filter_by_attribute(scope, attribute, attribute_value)
    return scope unless attribute && attribute_value.present?

    scope.where(scope.sanitize_sql_for_conditions([ "#{attribute} = ?", attribute_value ]))
  end

  def filter_by_attributes(scope, attribute, attribute_values)
    return scope unless attribute && attribute_values.present?

    scope.where(scope.sanitize_sql_for_conditions([ "#{attribute} IN (?)", attribute_values ]))
  end

  def filter_by_period(scope, attribute, attribute_values)
    return scope unless attribute && attribute_values.values.all?(&:present?)

    scope.where(scope.sanitize_sql_for_conditions([ "#{attribute} between (?) and (?)", attribute_values[:from],
                                                   attribute_values[:to] ]))
  end
end
