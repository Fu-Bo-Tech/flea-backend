MyGoodsQuery = GraphQL::Field.define do
  type GoodsConnectionType
  description 'User\'s goods'
  argument :after, types.String
  argument :before, types.String
  argument :first, types.Int
  argument :last, types.Int
  resolve -> (obj, _, _) do
    obj.goods
  end
end
