# FIXME: extract out generator later.
JoinedGoodsQuery = GraphQL::Field.define do
  type GoodsConnectionType
  description 'User have bidded goods'
  argument :after, types.String
  argument :before, types.String
  argument :first, types.Int
  argument :last, types.Int
  resolve -> (obj, _, _) do
    obj.joined_goods
  end
end
