GraphQL::ObjectType.accepts_definitions(camelized_field: CamelizedField)
GraphQL::InterfaceType.accepts_definitions(camelized_field: CamelizedField)
SiteSchema.node_identification = NodeIdentification

# Error handling
SiteSchema.rescue_from(ActiveRecord::RecordNotFound, &:message)
SiteSchema.rescue_from(ActiveRecord::RecordInvalid) { |e| e.record.errors }
SiteSchema.rescue_from(StandardError, &:message)
