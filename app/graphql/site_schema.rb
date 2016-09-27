SiteSchema = GraphQL::Schema.new(query: QueryType, mutation: MutationType)
SiteSchema.node_identification = NodeIdentification

# Error handling
SiteSchema.rescue_from(ActiveRecord::RecordNotFound, &:message)
SiteSchema.rescue_from(ActiveRecord::RecordInvalid) { |e| e.record.errors }
SiteSchema.rescue_from(Auth::Unauthenticated) { |_| 'You should login first!' }
SiteSchema.rescue_from(StandardError, &:message)
