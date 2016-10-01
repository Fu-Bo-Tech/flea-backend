MyBiddingsQuery = GraphQL::Field.define do
  type BiddingsConnectionType
  description 'User\'s biddings'
  argument :after, types.String
  argument :before, types.String
  argument :first, types.Int
  argument :last, types.Int
  resolve -> (obj, _, _) do
    obj.biddings
  end
end
