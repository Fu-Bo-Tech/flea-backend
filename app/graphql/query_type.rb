QueryType = GraphQL::ObjectType.define do
  name 'QueryRoot'
  description 'Its query root of schema'

  field :good do
    type GoodType
    description 'Query good by its id'
    argument :id, !types.ID
    resolve -> (_, args, _) { Good.find(args['id']) }
  end

  field :goods do
    type types[GoodType]
    description 'Query all goods with limit'
    argument :limit, types.Int, default_value: 20
    resolve(
      lambda do |_, args, _|
        limit = [args[:limit], 30].min
        Good.all.limit(limit)
      end
    )
  end
end
