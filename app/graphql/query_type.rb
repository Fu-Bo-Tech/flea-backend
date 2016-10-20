QueryType = GraphQL::ObjectType.define do
  name 'QueryRoot'
  description 'Its query root of schema'

  field :good, field: GoodQuery
  connection :allGoods, field: AllGoodsQuery

  field :user, field: UserQuery

  field :node, field: NodeIdentification.field
end
