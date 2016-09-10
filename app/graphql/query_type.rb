QueryType = GraphQL::ObjectType.define do
  name 'QueryRoot'
  description 'Its query root of schema'

  field :good do
    type GoodType
    description 'Query good by its id'
    argument :id, !types.ID, 'Id of good'
    resolve -> (_, args, _) { Good.find(args['id']) }
  end

  # field :goods do
  #   type types[GoodType]
  #   description 'Query all goods with limit'
  #   argument :limit, types.Int, 'Number of response resources limit', default_value: 20
  #   resolve(
  #     lambda do |_, args, _|
  #       limit = [args[:limit], 30].min
  #       Good.all.limit(limit)
  #     end
  #   )
  # end

  connection :allGoods, AllGoodsConnectionType, max_page_size: 50 do
    description 'Query all goods'
    argument :after, types.String
    argument :before, types.String
    argument :first, types.Int
    argument :last, types.Int
    resolve -> (obj, args, ctx) do
      Good.all
    end
  end

  field :node, field: NodeIdentification.field
end
