QueryType = GraphQL::ObjectType.define do
  name 'QueryRoot'
  description 'Its query root of schema'

  field :good do
    type GoodType
    description 'Query good by its id'
    argument :id, !types.ID, 'Id of good'
    resolve -> (_, args, ctx) do
      NodeIdentification.object_from_id(args[:id], ctx)
    end
  end

  connection :myGoods, AllGoodsConnectionType, max_page_size: 50 do
    description 'Query user\'s goods'
    argument :after, types.String
    argument :before, types.String
    argument :first, types.Int
    argument :last, types.Int
    resolve Auth.query_authenticate_user! do |_, _, ctx|
      user = ctx[:current_user]
      user.goods
    end
  end

  connection :allGoods, AllGoodsConnectionType, max_page_size: 50 do
    description 'Query all goods'
    argument :after, types.String
    argument :before, types.String
    argument :first, types.Int
    argument :last, types.Int
    resolve -> (_, _, _) do
      Good.all
    end
  end

  field :user do
    type UserType
    description 'Query account info'
    resolve Auth.query_authenticate_user! do |_, _, ctx|
      ctx[:current_user]
    end
  end

  field :node, field: NodeIdentification.field
end
