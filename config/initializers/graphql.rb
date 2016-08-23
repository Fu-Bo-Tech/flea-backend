# Then hook up that callable to `.define`:
GraphQL::ObjectType.accepts_definitions(camelized_field: CamelizedField)
GraphQL::InterfaceType.accepts_definitions(camelized_field: CamelizedField)
SiteSchema.node_identification = NodeIdentification
