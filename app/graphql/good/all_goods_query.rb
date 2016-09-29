AllGoodsQuery = GraphQL::Field.define do
  type AllGoodsConnectionType
  description 'Query all goods'
  argument :after, types.String
  argument :before, types.String
  argument :first, types.Int
  argument :last, types.Int
  resolve -> (_, _, _) do
    Good.all
  end
end