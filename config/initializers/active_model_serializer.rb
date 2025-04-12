ActiveModelSerializers.config.tap do |c|
  c.adapter = ActiveModelSerializers::Adapter::JsonApi
  c.jsonapi_resource_type = :plural
  c.serializer_lookup_enabled = false
  # If key transforms are unnecessary for the application,
  # setting config.key_transform to :unaltered will provide a performance boost.
  c.key_transform = :unaltered
  c.default_includes = "**"
end
