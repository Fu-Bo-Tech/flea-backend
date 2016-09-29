QueryType = GraphQL::ObjectType.define do
  name 'QueryRoot'
  description 'Its query root of schema'

  field :good, field: GoodQuery
  connection :myGoods, field: MyGoodsQuery, max_page_size: 50
  connection :allGoods, field: AllGoodsQuery, max_page_size: 50

  field :user, field: UserQuery

  field :node, field: NodeIdentification.field
end
