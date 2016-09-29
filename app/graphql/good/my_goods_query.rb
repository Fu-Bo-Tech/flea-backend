MyGoodsQuery = GraphQL::Field.define do
  type AllGoodsConnectionType
  description 'Query user\'s goods'
  argument :after, types.String
  argument :before, types.String
  argument :first, types.Int
  argument :last, types.Int
  resolve Auth.authenticate_user! -> (_, _, ctx) do
    user = ctx[:current_user]
    user.goods
  end
end